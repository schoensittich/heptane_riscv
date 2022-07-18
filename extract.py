import sys
import argparse
import os


class Architecture:
    arch = {
        "riscv" : 1,
        "arm" : 2
    }

class Extract:

    def __init__(self) -> None:
        self.parser = self.add_arg_parser()
        self.args = self.parser.parse_args()
        self.result_path = self.make_result_dir()

    def add_arg_parser(self) -> argparse.ArgumentParser:
        parser = argparse.ArgumentParser(description='Heptane Extract')
        parser.add_argument('--arch', dest='arch', type=str, help='Architecture [RISCV or ARM]', required=True)
        parser.add_argument('--bench', dest='bench', type=str, help='Name of the benchmark', required=True)
        parser.add_argument('--out', dest='out', type=str, help='Output directory', required=True)
        return parser
    
    def make_result_dir(self):
        path = "{cwd}/benchmarks/{bench}".format(cwd = os.getcwd(), 
                                                 bench=self.args.bench)
        print(path)




def main():
    extract = Extract()

if __name__ == '__main__':
    sys.exit(main())  