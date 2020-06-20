let GitHubActions = (./imports.dhall).GitHubActions

let prettier = ./jobs/prettier.dhall

let shellcheck = ./jobs/shellcheck.dhall

let shfmt = ./jobs/shfmt.dhall

let checkDocs = ./jobs/check-docs-up-to-date.dhall

let dhallFormat = ./jobs/dhall-format.dhall

in  GitHubActions.Workflow::{
    , name = "CI"
    , on = GitHubActions.On::{
      , push = Some GitHubActions.Push::{ branches = Some [ "master" ] }
      , pull_request = Some GitHubActions.PullRequest::{
        , branches = Some [ "master" ]
        }
      }
    , jobs = toMap { prettier, shellcheck, shfmt, checkDocs, dhallFormat }
    }
