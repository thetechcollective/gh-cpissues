#!/bin/bash

/startup.sh
# Give some time for cpissues to copy all.
sleep 5

/test.sh

/shutdown.sh
