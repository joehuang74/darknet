#!/bin/bash
cd ..
./darknet classifier train cfg/cifar.data cfg/cifar-tiny.cfg
#./darknet classifier valid cfg/cifar.data cfg/cifar-tiny.cfg backup/cifar-tiny.backup