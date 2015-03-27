# Contributing

This project is hosted on Github:

**[https://github.com/gar1t/erlang-patterns](https://github.com/gar1t/erlang-patterns)**

This contribution policy has been adapted from
[C4.1 - Collective Code Construction Contract](http://rfc.zeromq.org/spec:22)
to meet the needs of this project. It is subject to change and
suggested improvements are welcome.

## Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in RFC 2119.

## Goals

- To maximize the scale of the community around the project by
  reducing the friction for new Contributors

- To relieve dependencies on key individuals by separating different
  skill sets so that there is a larger pool of competence in any
  required domain

- To support diversity of the contributions to the project

- To enforce collective ownership of the project

## Design

### Preliminaries

- The project SHALL use the git distributed revision control system.

- The project SHALL be hosted on github.com or equivalent, herein
  called the "Platform".

- The project SHALL use the Platform issue tracker.

- A "Maintainer" is a person who merges patches to the
  project. Maintainers are not developers - their job is to enforce
  process.

- Maintainers SHALL have commit access to the repository.

- A "Contributor" is a person who wishes to provide a patch, being a
  set of commits that solve some clearly identified problem.

- Contributors SHALL NOT have commit access to the repository unless
  they are also Maintainers.

- Everyone without distinction or discrimination SHALL have an equal
  right to become a Contributor under the terms of this contract.

### Licensing and Ownership

- The project SHALL use the Creative Commons Attribution 4.0
  International license.

- All contributions to the project source code ("patches") SHALL use
  the same license as the project.

- All patches are owned by their authors. There SHALL NOT be any
  copyright assignment process.

- The copyrights in the project SHALL be owned collectively by all its
  Contributors.

- Each Contributor SHALL be responsible for identifying themselves in
  the project Contributor list.

### Patch Requirements

- Maintainers and Contributors MUST have a Platform account and SHOULD
  use their real names or a well-known alias.

- A patch SHOULD be a minimal and accurate answer to exactly one
  identified and agreed upon problem.

- A patch MUST adhere to the project Methodology (see METHODOLOGY.md).

- A patch SHALL NOT include non-trivial code from other projects
  unless the Contributor is the original author of that code.

- A patch commit message SHOULD consist of a single short (less than
  50 character) line summarizing the change, optionally followed by a
  blank line and then a more thorough description.

- A "Correct Patch" is one that satisfies the above requirements.

### Development Process

- Change on the project SHALL be governed by the pattern of accurately
  identifying problems and applying minimal, sufficient solutions to
  these problems.

- To request changes, a user SHOULD log an issue on the project
  Platform issue tracker.

- The user or Contributor SHOULD write the issue by describing the
  problem they face or observe.

- The user or Contributor SHOULD seek consensus on the accuracy of
  their observation, and the value of solving the problem.

- Thus, the release history of the project SHALL be a list of
  meaningful issues logged and solved.

- To work on an issue, a Contributor SHALL fork the project repository
  and then work on their forked repository.

- To submit a patch, a Contributor SHALL create a Platform pull
  request back to the project.

- A Contributor SHALL NOT commit changes directly to the project.

- If the Platform implements pull requests as issues, a Contributor
  MAY directly send a pull request without logging a separate issue.

- To discuss a patch, people MAY comment on the Platform pull request,
  on the commit, or elsewhere.

- To accept or reject a patch, a Maintainer SHALL use the Platform
  interface.

- Maintainers SHOULD NOT merge their own patches except in exceptional
  cases, such as non-responsiveness from other Maintainers for an
  extended period (more than 1-2 days).

- Maintainers SHALL NOT make value judgments on correct patches.

- Maintainers SHALL merge correct patches from other Contributors
  rapidly.

- The Contributor MAY tag an issue as "Ready" after making a pull
  request for the issue.

- The user who created an issue SHOULD close the issue after checking
  the patch is successful.

- Maintainers SHOULD ask for improvements to incorrect patches and
  SHOULD reject incorrect patches if the Contributor does not respond
  constructively.

- Any Contributor who has value judgments on a correct patch SHOULD
  express these via their own patches.

- Maintainers MAY commit changes to non-source documentation directly
  to the project.

### Project Administration

- The project founders SHALL act as Administrators to manage the set
  of project Maintainers.

- The Administrators SHALL ensure their own succession over time by
  promoting the most effective Maintainers.

- A new Contributor who makes a correct patch SHALL be invited to
  become a Maintainer.

- Administrators MAY remove Maintainers who are inactive for an
  extended period of time, or who repeatedly fail to apply this
  process accurately.

- Administrators SHOULD block or ban "bad actors" who cause stress and
  pain to others in the project. This should be done after public
  discussion, with a chance for all parties to speak. A bad actor is
  someone who repeatedly ignores the rules and culture of the project,
  who is needlessly argumentative or hostile, or who is offensive, and
  who is unable to self-correct their behavior when asked to do so by
  others.
