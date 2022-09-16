# openQA tests for Pop!_OS

Tests are run on both released and debug isos. 

### LTS

| Test                    | Status   | Depends on |
| ----------------------- | -------- | ---------- |
| Install                 | Working* | NA         |
| Custom Partitions       | Working* | NA         |
| No Encryption           | Working* | NA         |
| Refresh from Recovery   | Working  | Install    |
| Reinstall from Recovery | Working  | Install    |
| Refresh from  OS        | Not used | Install    |
| Refresh from USB        | Working  | Install    |
| Update from LTS to STS  | Not Used | Install    |
| Legacy Install (bios)   | Working  | NA         |

* Minor soft failures 

### Software

| Package     | Status   | Release tested |
| ----------- | -------- | -------------- |
| Steam       | Working  | LTS            |
| OBS         | Working  | LTS            |
| Lynis       | Working* | LTS            |
| Lutris      | Working  | LTS            |
| Pop!_Shop   | Working  | LTS            |
| Virtual Box | Working  | LTS            |

### PRs

Work is on going.

| Package       | Status   | Based on      |
| ------------- | -------- | ------------- |
| Kernel        | Working  | NA            |
| Lutris        | Working  | Software Test |
| Steam         | Working  | Software Test |
| Nvidia Driver | Working* |               |

\* Install and dkms only. Driver needs hardware to test viability





### Further Documentation

SOP, test documentation, and templates for new tests can be found in the docs folder. 

---

# Original Readme

## Communication

If you have questions, visit us on IRC in
[#opensuse-factory](irc://chat.freenode.net/opensuse-factory)

## Contribute

This project lives in
https://github.com/os-autoinst/os-autoinst-distri-example

Feel free to add issues in github or send pull requests.

### Rules for commits

* For git commit messages use the rules stated on
  [How to Write a Git Commit Message](http://chris.beams.io/posts/git-commit/)
  as a reference

If this is too much hassle for you feel free to provide incomplete pull
requests for consideration or create an issue with a code change proposal.

### Local testing and CI environment

This repo is intended to be used with openQA as a learning example. The
example was first featured in the workshop talk [osc14: Ludwig Nussel, How to
write openQA tests](https://youtu.be/EM3XmaQXcLg).

One can also use the same code for running standalone isotovideo. The workflow
based on isotovideo is also used by the CI pipeline which serves as another
example how one can integrate isotovideo into a CI pipeline, here based on the
example of github actions.

Find the latest status from CI runs in
https://github.com/os-autoinst/os-autoinst-distri-example/actions

A basic CI pipeline is defined within
[.github/workflows/isotovideo.yml](.github/workflows/isotovideo.yml)
showing how isotovideo can be run against the tests. Note that this pipeline
will succeed as long as isotovideo could successfully execute the complete
test flow regardless of their individual results.

A more advanced example is shown in
[.github/workflows/isotovideo-check-all-test-modules.yml](.github/workflows/isotovideo-check-all-test-modules.yml)
which defines a pipeline that will fail if any test module returns any other
status than "ok", for example "failed".

Effectively the same workflow can be found in
[.github/workflows/isotovideo-action.yml](.github/workflows/isotovideo-action.yml),
it only uses a more GitHub action specific syntax. This makes it easier to
integrate into more complex workflows but it is less suitable for executing on
your local machine.

## License

This project is licensed under the GPL v2 license, see COPYING file for
details.
