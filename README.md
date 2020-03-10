# circleci-orb-tfenv

[![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/suzuki-shunsuke/tfenv)](https://circleci.com/orbs/registry/orb/suzuki-shunsuke/tfenv)
[![CircleCI](https://circleci.com/gh/suzuki-shunsuke/circleci-orb-tfenv.svg?style=svg)](https://circleci.com/gh/suzuki-shunsuke/circleci-orb-tfenv)
[![GitHub last commit](https://img.shields.io/github/last-commit/suzuki-shunsuke/circleci-orb-tfenv.svg)](https://github.com/suzuki-shunsuke/circleci-orb-tfenv)
[![License](http://img.shields.io/badge/license-mit-blue.svg?style=flat-square)](https://raw.githubusercontent.com/suzuki-shunsuke/circleci-orb-tfenv/master/LICENSE)

CircleCI Orb to lint and test and apply Terraform configuration.
This Orb assumes tfenv is used at the target project.

For detail, please see https://circleci.com/orbs/registry/orb/suzuki-shunsuke/tfenv

## Sample repository

https://github.com/suzuki-shunsuke/example-circleci-orb-tfenv

## How does this orb work?

You can construct the following pipeline for Terraform.

1. setup (checkout and install tools such as [tfenv](https://github.com/tfutils/tfenv), [tfnotify](https://github.com/mercari/tfnotify), and [github-comment-cli](https://github.com/suzuki-shunsuke/github-comment-cli))
2. lint and test Terraform configuration
3. apply the Terraform configuration

The following screenshot represents multiple Terraform configuration which are managed at a monorepo are tested in parallel.

https://circleci.com/workflow-run/c82b1a83-2db1-4b11-93c8-d8b6b0a58bef

<p align="center">
  <img src="https://cdn.jsdelivr.net/gh/suzuki-shunsuke/artifact@master/circleci-orb-tfenv/pipeline-diagram.png">
</p>

When it is failed to run `terraform fmt -check` or `terraform validate`, the result is posted by [github-comment-cli](https://github.com/suzuki-shunsuke/github-comment-cli).

https://github.com/suzuki-shunsuke/example-circleci-orb-tfenv/pull/3#issuecomment-597027003

<p align="center">
  <img src="https://cdn.jsdelivr.net/gh/suzuki-shunsuke/artifact@master/circleci-orb-tfenv/fmt-check-error.png">
</p>

https://github.com/suzuki-shunsuke/example-circleci-orb-tfenv/pull/3#issuecomment-597025376

<p align="center">
  <img src="https://cdn.jsdelivr.net/gh/suzuki-shunsuke/artifact@master/circleci-orb-tfenv/validate-error.png">
</p>

The results of `terraform plan` and `terraform apply` are posted by [tfnotify](https://github.com/mercari/tfnotify). Ofcourse you can change the format of the comment by tfnotify's configuration.

https://github.com/suzuki-shunsuke/example-circleci-orb-tfenv/pull/1#issuecomment-596910459

<p align="center">
  <img src="https://cdn.jsdelivr.net/gh/suzuki-shunsuke/artifact@master/circleci-orb-tfenv/plan.png">
</p>

https://github.com/suzuki-shunsuke/example-circleci-orb-tfenv/pull/1#issuecomment-596911629

<p align="center">
  <img src="https://cdn.jsdelivr.net/gh/suzuki-shunsuke/artifact@master/circleci-orb-tfenv/apply.png">
</p>

## License

[MIT](LICENSE)
