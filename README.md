# calabash-demo
calabash

Android 
RubyDoc: http://www.rubydoc.info/gems/calabash-android

iOS 
RubyDoce: http://www.rubydoc.info/gems/calabash-cucumber


Google Group: https://groups.google.com/forum/#!forum/calabash-android
Calabash-cucumber (ios)
APIs from Github: https://github.com/calabash/calabash-ios/wiki/Calabash-iOS-Ruby-API
APIs from Rubydoc: http://www.rubydoc.info/gems/calabash-cucumber/Calabash
APIs from Rubydoc appear to be much more extensive.
Google Group: https://groups.google.com/forum/#!forum/calabash-ios
Capybara (web)
APIs from Rubydoc: http://www.rubydoc.info/github/jnicklas/capybara/Capybara

Mac Setup:

Setup steps:
Open a terminal window and type open ~/.bash_profile and set the following environment variables;
export ANDROID_HOME=/Applications/adt-bundle-mac-x86_64-20140321/sdk
This is set to where Self Service places the SDK. It can be moved anywhere as long as the set path is correct.
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
PATH must be as shown.
export JAVA_HOME=$(/usr/libexec/java_home)
This is set as per Apple development recommendation.
 
2. Save, close terminal, and  open a new terminal window. Check each of the following to ensure the profile has been configured correctly.
echo $ANDROID_HOME
/Applications/adt-bundle-mac-x86_64-20140321/sdk
echo $JAVA_HOME
/Library/Java/JavaVirtualMachines/jdk1.7.0_75.jdk/Contents/Home
echo $PATH
/Users/a568103/.rvm/gems/ruby-2.1.5/bin:/Users/a568103/.rvm/gems/ruby-2.1.5@global/bin:/Users/a568103/.rvm/rubies/ruby-2.1.5/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/adt-bundle-mac-x86_64-20140321/sdk/tools:/Applications/adt-bundle-mac-x86_64-20140321/sdk/platform-tools:/Users/a568103/.rvm/bin
NOTE: In the above, ensure the expected $PATH is correct. The others will be added further in setup.
$ adb
Command line options for the android debug bridge will display.
$ java
Command line option for java will display.
 
3. Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
After installation, execute $ brew doctor
On a successful installation, the message "Your system is ready to brew" is displayed.
Each time a brew function is to be performed, execute $ brew update
This ensures you are always on the most up to date brew.
 
4. Install Git
Execute $ brew install git
After installation, execute $ git --version
On a successful installation, you will see "git version 2.3.3" or later
 
5. Install RVM
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --ruby
RVM installation may take a few minutes. Once done, quit, relaunch Terminal, and then execute $ type rvm | head -1
On a successful installation, the message "rvm is a function" is displayed.
Execute $ rvm -v
On a successful installation, you will see "rvm 1.26.10" or higher displayed.
Execute $ ruby -v
On a successful installation, you will see "ruby 2.2.0" or higher displayed.
Execute $ brew doctor
If no issues have occurred during setup, the message "Your system is ready to brew" is displayed. 
 
6. Install Ruby 2.1.5
Execute $ rvm list rubies
This displayed all RVM installed versions of ruby.
Execute $ rvm install 2.1.5
This installs Ruby 2.1.5 to be useable/interchangeable via RVM.
After installation, execute $ rvm use 2.1.5 --default
This configures rvm to use Ruby 2.1.5 as the default in all instances.
Verify by executing $ ruby -v
On a successful installation, you will see "ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-darwin14.0]"
If the version of Ruby does not match exact as above, stop and troubleshoot.

7. Install Calabash for Android
Execute $ gem install calabash-android
This may take a few minutes.
 
8. Get debug.keystore
This can be found here - https://git.target.com/cartwheel/target-socsav-android
Place the debug.keytore on your local ~/.android
If the file already exist, overwrite it.
 
 
10. Get a debug apk
Debug apks can be found here - Android Debug Builds
 

Android setup complete!


IOS SETUP

Environment Setup:
1. Install Xcode (latest version at time of writing - Xcode 6.3)
2. Install the Xcode command line dev tools
execute $ xcode-select --install

3. Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
After installation, execute $ brew doctor
On a successful installation, the message "Your system is ready to brew" is displayed.
Each time a brew function is to be performed, execute $ brew update
This ensures you are always on the most up to date brew.
 
4. Install Git
Execute $ brew install git
After installation, execute $ git --version
On a successful installation, you will see "git version 2.3.3" or later
 
5. Install RVM
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --ruby
RVM installation may take a few minutes. Once done, quit, relaunch Terminal, and then execute $ type rvm | head -1
On a successful installation, the message "rvm is a function" is displayed.
Execute $ rvm -v
On a successful installation, you will see "rvm 1.26.10" or higher displayed.
Execute $ ruby -v
On a successful installation, you will see "ruby 2.2.0" or higher displayed.
Execute $ brew doctor
If no issues have occurred during setup, the message "Your system is ready to brew" is displayed. 
 
6. Install Ruby 2.1.5
Execute $ rvm list rubies
This displayed all RVM installed versions of ruby.
Execute $ rvm install 2.1.5
This installs Ruby 2.1.5 to be useable/interchangeable via RVM.
After installation, execute $ rvm use 2.1.5 --default
This configures rvm to use Ruby 2.1.5 as the default in all instances.
Verify by executing $ ruby -v
On a successful installation, you will see "ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-darwin14.0]"
If the version of Ruby does not match exact as above, stop and troubleshoot.
7. Install the calabash-cucumber by running $ gem install calabash-cucumber

Installing .app through command line:
install Node.js and ios-deploy
$ brew install node
$ npm install -g ios-deploy
Install .app on device ex: 
ios-deploy -b path/to/.app
NOTE: This is built into the automation project, and as such will install with your generic run commands.
 
iOS setup:
1. Download iOS source from Git
2. Open workspace in Xcode
3. Schemes > Manage Schemes
4. Add a new Scheme - 'Cartwheel-cal' - check the 'Shared' checkbox
5. Select the Cartwheel-cal scheme
6. Scheme menu > Edit Schemes...
7. Ensure that the Build Configuration drop-down menu is set to 'Debug' - click Close.
8. Select 'Cartwheel' under Targets > choose Build Settings
9. Search for 'other linker'
10. Expand 'Other Linker Flags' - double click to edit the setting for the Debug linker flag
11. Add three new lines (in the following order, exactly as shown):
-all_load
-framework
calabash
12. Launch Terminal
$ cd [path/to/iOS/project/directory/]
13. Run the following:
$ calabash-ios download
14. From the Xcode menubar, choose Product > Clean
15. Ensure the Cartwheel-cal scheme is still selected and choose Product > Run.
16. Allow network permissions when prompted (Prompt is caused by calabash test server trying to make an http connection to the app).
17. Accept notification prompt by clicking OK
18. Quit the iOS Simulator
19. In terminal, run
$ calabash-ios console
$ start_test_server_in_background inject_dylib:true
# inject_dylib:true will allow for https connection to Facebook login
20. Allow network permissions when prompted.

To change the simulator device used by the calabash-ios console:
1. Get a list of known devices on your system:
execute $ instruments -s devices
2. Execute
$ DEVICE_TARGET='iPad Air (8.3 Simulator)' calabash-ios console
$ start_test_server_in_background inject_dylib:true
To run calabash-ios console on a physical device:
$ BUNDLE_ID=com.target.Cartwheel DEVICE_TARGET=[UUID] DEVICE_ENDPOINT=http://[device ip address]:37265 calabash-ios console
$ start_test_server_in_background

