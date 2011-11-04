GHUnit with Xcode 4, CI with Jenkins and maybe more
===================================================

Created for 2011 Barcamp #YXE

Before you start
----------------

You will need the following:

* Xcode 4
* Access to a working Jenkins install with the following plugins: Jenkins GIT plugin
* git and a git repo hosted where you and Jenkins can access it

GHUnit
------

### Clone GHUnit to a familiar location.

    git clone https://github.com/gabriel/gh-unit.git

### Read the instructions, but I'll help you along anyways.

    http://gabriel.github.com/gh-unit/docs/index.html

### Compile as per the instructions.

> To build the framework for iOS, run make from within the Project-iOS directory. The framework is in Project-iOS/build/Framework/.

If this opens Finder window with GHUnitIOS.framework in it you have successfully built GHUnit.

GHUnit in a Xcode Project
-------------------------

### Create a new target in your Xcode project, perhaps named GHUnitTest. This link takes you through it, but we can summarize here.

    http://gabriel.github.com/gh-unit/docs/appledoc_include/guide_install_ios_4.html

### New Target as Empty Application.

![Empty Project](/interlock/barcampyxe-ios-ut-ci/raw/master/images/empty_project.png)

![Empty Project Create](/interlock/barcampyxe-ios-ut-ci/raw/master/images/empty_project_create.png)

At this point, you want to get GHUnit into your project.

In the root of your project, create a folder: ```Vendors```

Remember that GHUnitIOS.framework package? Copy that folder into Vendors.

    git add Vendors; git commit -m "Vendor directory with GHUnit framework"

### Add GHUnit Framework to Project

![Test Project Frameworks](/interlock/barcampyxe-ios-ut-ci/raw/master/images/project_frameworks.png)

You will want to ```Add Other``` and browse to your ```Vendors/GHUnitIOS.framework``` you copied earlier

![GHUnit Browsed]()

Xcode is dumb, so you will have to move that framework to your frameworks folder if you are OCD.

### Project Tweaks

In the build settings for your GHUnitTest target, you need to add two linker flags: -ObjC and -all_load

![Linker Flags](/interlock/barcampyxe-ios-ut-ci/raw/master/images/extra_linker_options.png)

### Modify your main entry point

You will want to use the AppDelegate provided in the GHUnitIOS.framework, "GHUnitIOSAppDelegate"

![GHUnit App Delegate](/interlock/barcampyxe-ios-ut-ci/raw/master/images/ghunit_app_delegate.png)

### Run GHUnitTest

If you didn't bugger anything up, everything should compile and run.

![GHUnit in iOS](/interlock/barcampyxe-ios-ut-ci/raw/master/images/ghunit_on_iphone.png)

Some Simple GHUnit Tests
------------------------

GHUnit can do all sorts of amazing tests, you can see examples in their docs: http://gabriel.github.com/gh-unit/docs/appledoc_include/guide_testing.html 


Pre Jenkins Setup
-----------------

To do CI with Jenkins you will need to setup some scripts that manage building and testing from the command line. Lucky us,
I have included those scripts for you.

### Scripts

Copy the ```Scripts``` folder from this repo into the root of your project.

Move the script ```buildAndTest.sh``` and ```MakeFile``` to the root folder of your project:

```sh
mv Scripts/buildAndTest.sh .
mv Scripts/Makefile .
```
### Add a Script step to the Build Target GHUnitTest

Add this ```sh "${PROJECT_DIR}/Scripts/RunTests.sh"```

![Run Script](/interlock/barcampyxe-ios-ut-ci/raw/master/images/run_script.png)



New Jenkins Job
---------------

Before starting this portion, you will want to have your git repo pushed someplace jenkins can get to it. I hear github works?

### Create a Free Style Project

![New Job](/interlock/barcampyxe-ios-ut-ci/raw/master/images/jenkins_new_job.png)

### Add your git repo

![Git Repo](/interlock/barcampyxe-ios-ut-ci/raw/master/images/jenkins_git.png)


### Setup SCM Polling

Use the option ```Poll SCM``` with the settings ```* * * * *```

![SCM Polling](/interlock/barcampyxe-ios-ut-ci/raw/master/images/jenkins_poll.png)

### Add Build Step

```sh
sh "$WORKSPACE/buildAndTest.sh"
```

![Build Step](/interlock/barcampyxe-ios-ut-ci/raw/master/images/jenkins_build_step.png)

### JUnit Report

The path to the JUnit XML files is here: ```build/test-results/*.xml```

![JUnit](/interlock/barcampyxe-ios-ut-ci/raw/master/images/jenkins_junit.png)


Jenkins CI
----------



Thanks
------

I've pulled parts of this from all over the place. If you see you work in here, push an update to this section.
