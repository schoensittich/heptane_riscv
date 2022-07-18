/* ---------------------------------------------------------------------

Copyright IRISA, 2003-2017

This file is part of Heptane, a tool for Worst-Case Execution Time (WCET)
estimation.
APP deposit IDDN.FR.001.510039.000.S.P.2003.000.10600

Heptane is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Heptane is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details (COPYING.txt).

See CREDITS.txt for credits of authorship

------------------------------------------------------------------------ */

/*****************************************************************
                             SymbolTableAttribute
	This is a sharedAttribute generated by the Extractor

	This attribute is attached to the program and store the
    informations present in the symbol table of the objdump
    and the readelf files

*****************************************************************/


#include <string>
#include <utility>
#include <map>
#include "CfgLib.h"

#ifndef SYMBOLTABLE
#define SYMBOLTABLE



			    //This class is defined to store variable related information
			    //rq: tuple is defined only for c++11
class triplet
{
 public:
  unsigned long first;
  int second;
  std::string third;

  triplet (){}
  triplet (unsigned long v1, int v2, std::string v3)
    {
      first=v1;
      second=v2;
      third=v3;
    }
};


class SymbolTableAttribute : public cfglib::SerialisableAttribute
{
 private:
  map<std::string,std::pair<unsigned long, int> > sections; //name -> <addr,size>
  map<std::string,triplet > variables; //name -> <addr,size,section>
    
  //extra
  unsigned long _gp; //gp value (MIPS, RISCV specific)
    
    
 public:

  /*!constructor*/
  SymbolTableAttribute();

  /*!cloning function*/
  SymbolTableAttribute *clone();

  // Serialisation function
  ostream& WriteXml(std::ostream&,cfglib::Handle&);
  void ReadXml(XmlTag const*xml_node,cfglib::Handle&) ;

  SerialisableAttribute *create() ;

  //debug
  void Print(std::ostream&);
    
  //add a section
  void addSection(std::string name, unsigned long addr, int size);
    
  //add variable
  void addVariable(std::string name, unsigned long addr, int size, std::string section_name);

  //set value of register GP
  void setGP(unsigned long val);

  //get GP register value
  unsigned long getGP();
    
  // get the start address of the code
  unsigned long getCodeStartAddr();
    
  /*! Returns the informations: variable name, start_addr, size and section name of the given addr.
    rq: the input address must be in decimal
  */
  bool getInfo(unsigned long addr, string* var_name, unsigned long* start_addr, int* size, string* section_name);
}; 
#endif
