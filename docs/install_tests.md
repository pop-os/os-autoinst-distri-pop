## Summary

Install tests are found in products and their associated folder (lts, sts, next). 

Each version tested will have the same subset of tests and can be copied and modified based on major changes between lts and sts. Of course a symlink wil also work if the tests are largerly the same.

## Tests

Each OS version (LTS,STS,etc.) will have a set of subfolders which contains the actual test. Below is a list of tests currenlty in use:

* std: This test is the basis for all other tests. It represents the typical install of pop!\_os

* no_encryption: Same as the standard test with encryption disabled

* custom_parts1: Based on Levi's custom partition test which mimics the standard partition table layout

* no_save: This is used for legacy testing and is a symlink to std. 

* recovery: Using the harddrive image made by std the recovery test goes through our standard recovery testing proceedure using the refresh option.

* recovery_reinstall: Same as above but reinstalling instead of refreshing.

* refresh_from_USB: Runs through the process of refreshing the install from a live disk instead of the recovery partition.

* refresh_from_OS: Not currenlty in use.

* 
