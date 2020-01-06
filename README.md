# Flatiron Manual Setup Installation and Validation Scripts

Scripts to automatically install required tools and verify successful installation based on the manual macOS setup guide.

## Instructions

To run the automatic install script, run the following in terminal:

```sh
curl -so- https://raw.githubusercontent.com/learn-co-curriculum/flatiron-manual-setup-validator/master/automatic-install.sh | bash 2> /dev/null
```

At the end, follow the steps printed in the terminal to complete your local environment setup. To verify that everything is successfully installed, run the following:

```sh
curl -so- https://raw.githubusercontent.com/learn-co-curriculum/flatiron-manual-setup-validator/master/manual-setup-check.sh | bash 2> /dev/null
```
