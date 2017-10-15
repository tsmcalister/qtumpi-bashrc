# Overview

This .bashrc file was specifically designed for a raspberrypi runing a qtum node. 
It is a work in progress and more features will be added over time.

<img src="https://raw.githubusercontent.com/tsmcalister/qtumpi-bashrc/master/qtumpi.png" width="400" >


# Installation
Make sure you are in your home directory and then run the following commands:
1) `sudo apt-get update`
2) `yes | sudo apt-get install git jq`
3) `git clone https://github.com/tsmcalister/qtumpi-bashrc.git`
4) Edit line 113 of the .bashrc file to fit your qtum-cli location (default is ~/qtum-wallet/bin/qtum-cli)
5) `cp qtumpi-bashrc/.bashrc .`
6) `source .bashrc`
