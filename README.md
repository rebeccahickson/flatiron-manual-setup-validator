# Flatiron Manual Setup Installation and Validation Scripts

Scripts to automatically install required tools and verify successful installation based on the manual macOS setup guide.

**Note:** These scripts are for macOS users **only** and will not work for Windows users. If you are a Windows user, refer to the [WSL Setup Guide](https://github.com/learn-co-curriculum/wsl-setup) or the [Virtual Box Setup Instructions](https://help.learn.co/en/articles/1489324-setting-up-linux-virtual-box). 

For detailed installation and setup instructions for macOS Catalina, see the full [MacOS Catalina Setup Instructions](https://github.com/learn-co-curriculum/environment-mac-os-catalina-setup).

## Instructions

To run the automatic install script, run the following in terminal:

```sh
curl -so- https://raw.githubusercontent.com/learn-co-curriculum/flatiron-manual-setup-validator/master/automatic-install.sh | bash 2> /dev/null
```

At the end, follow the steps printed in the terminal to complete your local environment setup. To verify that everything is successfully installed, run the following:

```sh
curl -so- https://raw.githubusercontent.com/learn-co-curriculum/flatiron-manual-setup-validator/master/manual-setup-check.sh | bash 2> /dev/null
```
