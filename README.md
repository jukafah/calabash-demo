## calabash-demo

**Resources**

**Android**
- RubyDoc: http://www.rubydoc.info/gems/calabash-android
- Google Group: https://groups.google.com/forum/#!forum/calabash-android

**iOS**
- RubyDoc: http://www.rubydoc.info/gems/calabash-cucumber
- Google Group: https://groups.google.com/forum/#!forum/calabash-ios

### Android Setup - Mac

Open a terminal and execute:

```
$ open ~/.bash_profile
```

set the following environment variables: 

```
export ANDROID_HOME=/path/to/android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export JAVA_HOME=$(/usr/libexec/java_home)
```

save changes, close profile, and then close and reopen terminal. Execute each of the following:  
*Note: Ensure the printed path is correct to your environment.*

```
$ echo $ANDROID_HOME
/path/to/android/sdk
$ echo $JAVA_HOME
/Library/Java/JavaVirtualMachines/jdk1.7.0_75.jdk/Contents/Home 
$ echo $PATH
/path/to/android/sdk/tools:/path/to/android/sdk/platform-tools
$ adb version  
Android Debug Bridge version 1.0.31
$ java -version
java version "1.7.0_75"
Java(TM) SE Runtime Environment (build 1.7.0_75-b13)
Java HotSpot(TM) 64-Bit Server VM (build 24.75-b04, mixed mode)
```
*Note: You will without a doubt have more than the above with $PATH*  
 
#### Install Homebrew

Still in Terminal, execute the following commands:
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

After installation:

```
$ brew doctor
Your system is ready to brew
```
*Note: You may get soft warnings on installation. The warning should be descriptive enough on whether or not action needs to be taken.*

#### Install Git

Still in terminal, execute:

```
$ brew install git
```

After installation, execute:

```
$ git --version
git version 2.3.3
```
 
#### Install RVM

We will first install RVM (Ruby Version Manager). This lets you seamlessly switch ruby versions that are in use. Still in terminal, execute:

```
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --ruby
```
*RVM installation may take a few minutes.* 

Once done, quit, relaunch Terminal, and then continue with executing:

```
$ rvm -v
rvm 1.26.10 (latest) by Wayne E. Seguin <wayneeseguin@gmail.com>, Michal Papis <mpapis@gmail.com> [https://rvm.io/]
$ ruby -v
ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-darwin14.0]
$ brew doctor
If no issues have occurred during setup, the message "Your system is ready to brew" is displayed. 
```
*Note: Some of your versions may be different. This is fine and will change in a later step.*
 
#### Install Ruby 2.1.5

Now we install ruby 2.1.5 via RVM by executing:

```
$ rvm install 2.1.5
```
*note: installation may take some time*

After installation, below command sets ruby 2.1.5 as the default version to use in Terminal:

```
$ rvm use 2.1.5 --default
$ ruby -v
ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-darwin14.0]
```

#### Install Calabash-Android

```
$ gem install calabash-android
```
*note: this may take a few minutes*

Check version:

```
$ calabash-android version
0.5.8
```

### Android setup complete.  

@todo:
calabash-android setup command and then creating test server
add generic debug.keystore creation command

### iOS Setup - Mac

#### Install Xcode

During installation, be sure to install command line tools. If not prompted, execute the below command in terminal:

```
$ xcode-select --install
```

*Note: Some of the below can be skipped if android setup has already been completed.*

#### Install Homebrew

Still in Terminal, execute the following commands:
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

After installation:

```
$ brew doctor
Your system is ready to brew
```
*Note: You may get soft warnings on installation. The warning should be descriptive enough on whether or not action needs to be taken.*

#### Install Git

Still in terminal, execute:

```
$ brew install git
```

After installation, execute:

```
$ git --version
git version 2.3.3
```
 
#### Install RVM

We will first install RVM (Ruby Version Manager). This lets you seamlessly switch ruby versions that are in use. Still in terminal, execute:

```
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --ruby
```
*RVM installation may take a few minutes.* 

Once done, quit, relaunch Terminal, and then continue with executing:

```
$ rvm -v
rvm 1.26.10 (latest) by Wayne E. Seguin <wayneeseguin@gmail.com>, Michal Papis <mpapis@gmail.com> [https://rvm.io/]
$ ruby -v
ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-darwin14.0]
$ brew doctor
If no issues have occurred during setup, the message "Your system is ready to brew" is displayed. 
```
*Note: Some of your versions may be different. This is fine and will change in a later step.*
 
#### Install Ruby 2.1.5

Now we install ruby 2.1.5 via RVM by executing:

```
$ rvm install 2.1.5
```
*note: installation may take some time*

After installation, below command sets ruby 2.1.5 as the default version to use in Terminal:

```
$ rvm use 2.1.5 --default
$ ruby -v
ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-darwin14.0]
```

#### Install Calabash-Cucumber (calabash-ios)

```
$ gem install calabash-cucumber
```
*note: this may take a few minutes*

@todo: add idevice setup for command line app installations and logging

### Integrating Calabash

To use calabash for iOS devices, the calabash.framework needs to be integrated into the actual app. Your iOS dev will probably have a preference for integration, but the below generally works for *most* setups.

1. Get the iOS source project
2. Navigate to source directory
3. In Terminal, execute:

```
$ calabash-ios download
```
*This command downloads the actual .framework that integrates into the app.*

4. Open the app workspace,
5. Navigate to Schemes => Manage Schemes,
6. Add the scheme: '<app-name>-cal' and check the 'shared' box,
7. Ensure build configuration is set to 'debug' and close,
   *Do NOT link your calabash build to a release configuration, as it can cause app store rejections and is all around bad dev practice*
8. Select '<app-name>' under Targets,
9. Click 'Build Settings'
10. Search for 'Other Linker Flags'
11. Expand 'Other Linker Flags', and under your 'Debug' configuration (or whichever you have created for calabash), add the following:

```
-force_load
calabash.framework/Versions/Current/calabash
```

12. Select your calabash scheme/config, and from the Xcode Menu, Product => Clean
13. Now, Product => Run,
14. A prompt should appear for the calabash server connecting to the app. Accept the prompt,
15. Quit the iOS Simulator
16. In terminal, execute:

```
$ calabash-ios console
$ start_test_server_in_background inject_dylib:true
# inject_dylib:true will allow for https connection in the simulator
```

To change simulators:  

Get a list of known devices (there will be many),

```
$ instruments -s devices
Known Devices:
6c40089cc7e2 [B2F0540F-49BA-5466-8DC0-283ADDC5E4A1]
Resizable iPad (8.4 Simulator) [6BB67E4E-68C4-4262-BA20-9345D2AAAB25]
Resizable iPad (8.4 Simulator) [8105A7F8-FACE-4D6F-BDCC-159CB42DB45E]
```

Simulators:

```
$ DEVICE_TARGET=<udid/name> calabash-ios console
$ start_test_server_in_background inject_dylib:true
```

Devices:

```
$ BUNDLE_ID=<app.package.name> DEVICE_TARGET=<udid> or <device> DEVICE_ENDPOINT=http://<device.ip>:37265 calabash-ios console
@todo: <message here>
```

Start test server (embedded calabash.framework):

```
$ start_test_server_in_background
```

### Calabash Tutorial

### @todo:

More!  
- windows setup
- API tutorial
- gherkin tutorial
- skeleton framework build w/ non dry cucumber
- basic end to end tests (manual to automated)

And More!!  
- POP design framework build w/ dry cucumber (*recommended*)
- upload example cross platform framework as baseline
