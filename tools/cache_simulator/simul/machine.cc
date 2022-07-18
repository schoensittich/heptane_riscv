/*! \file machine.cc 
//  \brief Routines to simulate the execution of user programs.
*/
//  DO NOT CHANGE -- part of the machine emulation
//
// Copyright (c) 1992-1993 The Regents of the University of California.
// All rights reserved.  See copyright.h for copyright notice and limitation 
// of liability and disclaimer of warranty provisions.

#include "machine.h"
#include "globals.h"

/*! Textual names of the exceptions that can be generated by user program
 execution, for debugging purpose.
*/
static char* exceptionNames[] = { "no exception", "syscall", 
				"page fault/no TLB entry", "page read only",
				"bus error", "address error", "overflow",
				"illegal instruction" };
#define EXCEPTION_NUMBER 7 //!< Size of exceptionNames, used for sanity checks

//----------------------------------------------------------------------
// CheckEndian
/*! 	Check to be sure that the host really uses the format it says it 
//	does, for storing the bytes of an integer.  Stop on error.
*/
//----------------------------------------------------------------------
static
void CheckEndian()
{
  // Declare an array of bytes and fills it with 1 2 3 4
  union checkit {
    char charword[4];
    unsigned int intword;
  } check;
  check.charword[0] = 1;
  check.charword[1] = 2;
  check.charword[2] = 3;
  check.charword[3] = 4;

  // Check the byte ordering according to the expected host endianess
#ifdef HOST_IS_BIG_ENDIAN
    ASSERT (check.intword == 0x01020304);
#else
    ASSERT (check.intword == 0x04030201);
#endif
}

// Routines for converting Words and Short Words to and from the
// simulated machine's format of little endian.  These end up
// being NOPs when the host machine is also little endian (DEC and Intel).
unsigned int
WordToHost(unsigned int word) {
#ifdef HOST_IS_BIG_ENDIAN
  return word;
#else
	 register unsigned long result;
	 result = (word >> 24) & 0x000000ff;
	 result |= (word >> 8) & 0x0000ff00;
	 result |= (word << 8) & 0x00ff0000;
	 result |= (word << 24) & 0xff000000;
	 return result;
#endif
}

unsigned short
ShortToHost(unsigned short shortword) {
#ifdef HOST_IS_BIG_ENDIAN
  return shortword;
#else
	 register unsigned short result;
	 result = (shortword << 8) & 0xff00;
	 result |= (shortword >> 8) & 0x00ff;
	 return result;
#endif
}

unsigned short
ShortToMachine(unsigned short shortword) { return ShortToHost(shortword); }

unsigned int
WordToMachine(unsigned int word) { return WordToHost(word); }

//----------------------------------------------------------------------
// Machine::Machine
/*! 	Constructor. Initialize the MIPS machine.
//
//	\param debug if true, drop into the debugger after each user instruction
//		is executed.
*/
//----------------------------------------------------------------------
Machine::Machine(bool debug)
{
    int i;

    // Set initial values for the integer and floating point registers
    for (i = 0; i < NumIntRegs; i++)
      int_registers[i] = 0;
    for (i = 0; i < NumFPRegs; i++)
      float_registers[i] = 0;

    // Allocate the main memory of the machine and fills it up with zeroes
    int memSize = cfg->NumPhysPages * cfg->PageSize;
    mainMemory = new char[memSize];
    for (i = 0; i < memSize; i++)
      mainMemory[i] = 0;

    // Check the endianess of the host machine
    CheckEndian();

    // Sets the debug mode of the machine according to the debug flag
    singleStep = debug;
}

//----------------------------------------------------------------------
// Machine::~Machine
//! 	Destructor. De-allocate the data structures used by the
//      simulated MIPS machine.
//----------------------------------------------------------------------
Machine::~Machine()
{
  // Deallocate the main memory
  delete [] mainMemory;
}

//----------------------------------------------------------------------
// Machine::RaiseException
/*! 	Transfer control to the Nachos kernel from user mode, because
//	the user program either invoked a system call, or some exception
//	occurred (such as the address translation failed).
//
//	\param which  the cause of the kernel trap (exception number)
//	\param badVaddr the virtual address causing the trap, if appropriate
*/
//----------------------------------------------------------------------
void
Machine::RaiseException(ExceptionType which, int badVAddr)
{

  // Sanity check of the exception number
  if (which <= EXCEPTION_NUMBER) {
    printf("Exception: %s: exiting\n", exceptionNames[which]);
    exit(-1);
  }
  else {
    printf("Nachos internal error: bad exception number %d, exiting\n",which);
    exit(-1);
  }
}

//----------------------------------------------------------------------
// Machine::DumpState
/*! 	Print the user program's CPU state.  We might print the contents
//	of memory, but that seemed like overkill. Floating point registers
//      are not printed for the same reason.
*/
//----------------------------------------------------------------------

void
Machine::DumpState()
{
    int i;

    // Print of the general CPU registers
    printf("Machine registers:\n");
    for (i = 0; i < NumGPRegs; i++)
	switch (i) {
	  case StackReg:
	    printf("\tSP(%d):\t0x%x%s", i, int_registers[i],
		   ((i % 4) == 3) ? "\n" : "");
	    break;
	    
	  case RetAddrReg:
	    printf("\tRA(%d):\t0x%x%s", i, int_registers[i],
		   ((i % 4) == 3) ? "\n" : "");
	    break;
	  
	  default:
	    printf("\t%d:\t0x%x%s", i, int_registers[i],
		   ((i % 4) == 3) ? "\n" : "");
	    break;
	}
    
    // Print the contents of the special CPU registers
    printf("\tHi:\t0x%x", int_registers[HiReg]);
    printf("\tLo:\t0x%x\n", int_registers[LoReg]);
    printf("\tPC:\t0x%x", int_registers[PCReg]);
    printf("\tNextPC:\t0x%x", int_registers[NextPCReg]);
    printf("\tPrevPC:\t0x%x\n", int_registers[PrevPCReg]);
    printf("\tLoad:\t0x%x", int_registers[LoadReg]);
    printf("\tLoadV:\t0x%x\n", int_registers[LoadValueReg]);
    printf("\n");
}

//----------------------------------------------------------------------
// Machine::ReadRegister/WriteRegister
//!   	Fetch or write the contents of CPU registers 
//      (integer/floating point/condition codes for floating point operations)
//----------------------------------------------------------------------

// read the contents of an integer register
int Machine::ReadIntRegister(int num) 
    {
	ASSERT((num >= 0) && (num < NumIntRegs));
	return int_registers[num];
    }
// write the contents of an integer register
void Machine::WriteIntRegister(int num, int value) 
    {
	ASSERT((num >= 0) && (num < NumIntRegs));
	int_registers[num] = value;
    }
// read the contents of a FP register
int Machine::ReadFPRegister(int num) 
{
  ASSERT((num >= 0) && (num < NumFPRegs));
  return float_registers[num];
}
 // store a value into a FP register
void Machine::WriteFPRegister(int num, int value)
{
  ASSERT((num >= 0) && (num < NumFPRegs));
  float_registers[num] = value;
}
// read the contents of the floating point condition code register
char Machine::ReadCC(void) 
{
  return cc;
}
// write the contents of the floating point condition code register
void Machine::WriteCC(char val) 
{
  cc = val;
}