# Jupyter Spark Easy Setup

I've created this script to help users set up an Ubuntu 16.04 virtual machine with Jupyter and Spark pre installed, set up and ready to use. This end product will give you access to the Jupyter interface reachable at [http://localhost:8888](http://localhost:8888) on your machine. There are only two dependencies to install, and the actual install of Apache Spark and Jupyter occurs within a virtual machine so should leave your host machine's settings untouched.

## What is a virtual machine?
From wikipedia:
 > In computing, a virtual machine (VM) is an emulation of a computer system.
 
In our case, a virtual machine is going to be an instance of a Linux system, running the Ubuntu 16.04 operating system with Spark and Jupyer pre installed on it. However, unlike a normal (non-virtual) machine, the operating system will be installed on to an emulated computer which you will run on your host machine, rather than onto physical hardware. In virtual machine terminology, the ```host machine``` is your physical laptop or desktop computer. This guide will work with host machines running Windows or MacOS. The ```guest machine``` is the emulated system, which in this case will have Ubuntu installed as it's operating system. The ```Hypervisor``` or emulator, is VirtualBox, and it allocates a certain amount of the ```host machine```'s resources to the ```guest machine```.

I've tested this with MacOS 10.12.2 as well as Windows 10 installed on the ```host machine```.

## Dependencies
1. [VirtualBox](https://www.virtualbox.org) is a hypervisor which will allow us to run a self-contained linux virtual machine. Your host machine can be Mac OS X, Windows or indeed another Linux distribution. Visit the [downloads](https://www.virtualbox.org/wiki/Downloads) page to get the correct version for your system.
2. [Vagrant](http://www.vagrantup.com) is a software package to automate the setup of VirtualBox virtual machines. This is what will be used to install and setup Apache Spark and Jupyter on the virtual machines without any user intervention required. Visit the [downloads](https://www.vagrantup.com/downloads.html) page, download and install the correct version for your system.

## Setup
Make sure you are reliably connected to the internet before attempting this. Vagrant will need to download Ubuntu, Spark and all the other dependencies. The default virtual machine settings allocate 1GB of RAM and 2 CPU cores to the virtual machine. Make sure your host machine has this available! If you'd like to increse this, check the advanced settings section below.

1.  Install the dependencies in the section above.
2.  Download a zip of the latest files from [here](https://github.com/ragnarula/vagrant-spark/archive/master.zip)
3.  Extract the zip and copy the ```vagrant-spark-master``` folder to a convenient permanent directory, such as your documents folder.
4.  Open a terminal and ```cd``` to the ```vagrant-spark-master``` directory
5.  Run the command ```vagrant up``` in the terminal
6.  Go relax for a while, make some tea or coffee, this bit takes some time. Vagrant will download and install Apache Spark as well as the Python 2.7 version of Anaconda, which includes Jupyter and lots of other fun python data science packages you can play with like numpy and scikit-learn.
7.  Once complete run the command ```vagrant ssh``` in the same ```vagrant-spark-master``` directory in the terminal.
8.  You should now be connected to your virtual machine's terminal. Run the command ```pyspark```. This will start the Jupyter server.
9.  In your web browser go to [http://localhost:8888](http://localhost:8888)
10. You should see the Jupyter interface!

## Usage

### Data and notebooks
Within the ```vagrant-spark-master``` directory extracted from the downloaded zip, you should see two directories ```data``` and ```notebooks```. Any files placed in ```data``` will be accessible at the path ```/data``` from within a notebook. Any notebooks placed in the ```notebooks``` directory will show up in the ```notebooks``` directory in the Jupyter interface.

### Vagrant Commands
These commands all must be run in a terminal within the ```vagrant-spark-master``` directory

* To stop the virtual machine run ```vagrant halt```
* To delete the machine run ```vagrant destroy```
* To start the machine (after stopping or destroying) run ```vagrant up```

### Advanced Settings

To increase the cpu and ram for the virtual machine open the ```VagrantFile``` file in a text editor and edit the ```v.memory``` and ```v.cpus``` settings on lines 11 and 12 respectively. After editing make sure you recreate the virtual machine using ```vagrant destroy``` and then ```vagrant up```.

## Feedback
If anyone has issues please contact me on Moodle, in class or via Github Issues above. Also feel free to send pull requests with bug fixes. 
