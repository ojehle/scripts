#!/bin/bash
hours=${1:-2}
log show --predicate 'subsystem == "com.apple.TimeMachine"' --info --last ${hours}h
