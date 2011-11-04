GHUnit with Xcode 4, CI with Jenkins and maybe more
===================================================

Created for 2011 Barcamp #YXE

Before you start
----------------

You will need the following:

* Xcode 4
* Access to a working Jenkins install with the following plugins:
* git and a git repo hosted where you and Jenkins can access it

GHUnit
------

1. Clone GHUnit to a familiar location.

    git clone https://github.com/gabriel/gh-unit.git

2. Read the instructions, but I'll help you along anyways.

    http://gabriel.github.com/gh-unit/docs/index.html

3. Compile as per the instructions.

> To build the framework for iOS, run make from within the Project-iOS directory. The framework is in Project-iOS/build/Framework/.

4. If this opens Finder window with GHUnitIOS.framework in it you have successfully built GHUnit.

GHUnit in a Xcode Project
-------------------------

1. Create a new target in your Xcode project, perhaps named GHUnitTest. This link takes you through it, but we can summarize here.

    http://gabriel.github.com/gh-unit/docs/appledoc_include/guide_install_ios_4.html

2. New Target as Empty Application.

![Empty Project](./raw/master/images/empty_project.png)

![Empty Project Create](./raw/master/images/empty_project_create.png)

3. At this point, you want to get GHUnit into your project.

In the root of your project, create a folder: ```Vendors```

Remember that GHUnitIOS.framework package? Copy that folder into Vendors.

    git add Vendors; git commit -m "Vendor directory with GHUnit framework"

Now 



Jenkins Project Setup
---------------------

Jenkins CI
----------


