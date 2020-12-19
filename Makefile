# Commands

local-execute:
	/bin/bash /home/sphere-master/local-execute.sh $(job)

help:
	# Usage:
	#   make <target> [OPTION=value]
	#
	# Targets:
	#   local-execute       Run job locally where option job=<job name from .circleci/config.yml> is required
	#
	#   help               You're looking at it!