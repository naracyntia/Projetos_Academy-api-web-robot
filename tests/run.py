import subprocess
import logging
import sys
import os
import ast

sys.path.append(os.path.dirname(os.path.dirname(__file__)))

from get_config import get_environment
from robot import run_cli

environment = get_environment()

if __name__ == "__main__":
    cli_args = [
        "--outputdir", "../logs",
        "--variable", f"ENV:{environment}",
        "."
    ]

    run_cli(cli_args)