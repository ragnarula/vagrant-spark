# Jupyter Spark Easy Setup

I've created this script to help users set up an Ubuntu 16.04 virtual machine with Jupyter and Spark pre installed, set up and ready to use. This end product will give you access to the Jupyter interface reachable at [http://localhost:8888](http://localhost:8888) on your machine. There are only two dependencies to install, and the actual install of Apache Spark and Jupyter occurs within a virtual machine so should leave your host machine's settings untouched.

## Dependencies
1. [VirtualBox](https://www.virtualbox.org) is a hypervisor which will allow us to run a self-contained linux virtual machine. Your host machine can be Mac OS X, Windows or indeed another Linux distribution. Visit the [downloads](https://www.virtualbox.org/wiki/Downloads) page to get the correct version for your system.
2. [Vagrant](http://www.vagrantup.com) is a software package to automate the setup of VirtualBox virtual machines. This is what will be used to install and setup Apache Spark and Jupyter on the virtual machines without any user intervention required. Visit the [downloads](https://www.vagrantup.com/downloads.html) page, download and install the correct version for your system.

## Setup
Make sure you are reliably connected to the internet before attempting this. Vagrant will need to download Ubuntu, Spark and all the other dependencies.

1.  Install the dependencies in the section above.
2.  Download a zip of the latest files from [here](https://github.com/ragnarula/vagrant-spark/archive/master.zip)
3.  Extract the zip and copy the ```vagrant-spark-master``` folder to a convenient permanent directory, such as your documents folder.
4.  Open a terminal and ```cd``` to the ```vagrant-spark-master``` directory
5.  Run the command ```vagrant up``` in the terminal
6.  Go make some tea/coffee, this bit takes a while. Vagrant will download and install Apache Spark as well as the Python 2.7 version of Anaconda, which includes Jupyter and lots of other fun python datascience packages you can play with like numpy and scikitlearn.
7.  Once complete run the command ```vagrant ssh``` in the same ```vagrant-spark-master``` directory in the terminal.
8.  You should now be connected to your virtual machine's terminal. Run the command ```pyspark```. This will start the Jupyter server.
9.  In your web browser go to [http://localhost:8888](http://localhost:8888)
10. You should see the Jupyter interface!

## Usage

### Data and notebooks
Within the ```vagrant-spark-master``` directory extracted from the downloaded zip, you should see two directories ```data``` and ```notebooks```. Any files placed in ```data``` will be accessible at the path ```/data``` from within a notebook. Any notebooks placed in the ```notebooks``` directory will show up in the ```notebooks``` directory in the Jupyter interface.

## Feedback
I've only tested this on my machine which is a Mac. It should work on windows too, but if anyone has issues please concat me on Moodle, in class or via Github Issues above.
