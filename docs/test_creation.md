## Summary

To create tests in OpenQA you will need to do the following.

1. Add a machine
2. Add a medium type 
3. Add a test suite
4. Add the test suite to a job group

## Machine

Most of the machines you will need have already been created if you have imported the templates provided. However, if you would like to modify an existing machine or add a new machine do the following:

1. Login to OpenQA as an administrator
2. Navigate to Machines in the dropdown menu.

We use qemu for our tests but others are available with their own set of options. Here is an example of a config used by os-autoinst which in turn sets up a virtualmachine based on these options.

```
HDDSIZEGB=30
QEMUCPU=qemu64
QEMUCPUS=2
QEMURAM=4096
QEMUTHREADS=2
QEMUVGA=virtio
UEFI=1
UEFI_PFLASH_CODE=/usr/share/ovmf/OVMF.fd
VGA=virtio
VIRTIO_CONSOLE=1
WORKER_CLASS=qemu_x86_64
```

Most are self explanatory but the last option `WORKER_CLASS` sets which openqa_worker will be used. By default we only have the x86_64 worker created by default, but if you look at the other machines that qemu can emulated other architectures and thus openQA can run tests against those as well.

## Medium Type

OpenQA depends on media types to tigger tests. This dictates the version and install media emulation type used by the virtual machine. To add or edit existing medium types select `medium types` under the main menu. These will need to be updated from time to time to make sure that the test scripts continue to work.

## Test Suite

The test suite informs OpenQA what folders and tests to run on the virtual machine once executed. To add or edit the tests suites navigate to `test suites` in the main menu. Like most of the other sections most of the options are self explanatory. The most important thing to note are the `START_AFTER_TEST` option and anything starting with `HDD`

## Job Groups

This is where it all comes together. A job group is a set of test suites that are executed based on all the above configs. You access Job Groups the same way as the other options as well. Below is an example of a job group.

```
defaults:
  x86_64:
    machine: 64bit
    priority: 50

products:
  pop_lts:
    distri: pop
    flavor: DVD
    version: '22.04'

scenarios:
  x86_64:
    pop_lts:
    - pop_lts
    - pop_lts_no_encryption
    - pop_lts_custom_parts1
    - pop_lts_refresh_from_USB
    - pop_lts_recovery_reinstall
    - pop_lts_recovery
    #- pop_next_install_de
    #- pop_next_install_ru
    - pop_upgrade_lts_to_sts
```

As you can see the first section dictates the machine that will be run created in machines. The next section is for products which must be set to an existing medium type. Here you can have multiple products listed. Lastly is the scenarios section. Here you lists the tests that you want run on the product and the machine listed in the above sections. 

## Issues

* The Job template when you create a Job Group is incorrectly formatted the above sample works and should be used in creating new tests.
* Though you should be able to add multiple machine types to the Job Group it does not work as expected and the tests will never run. (this should be fixed in later versions)
* Editing the Job Group must be done last. If you want to add a new medium or product they must be done first or your changes will be lost.
