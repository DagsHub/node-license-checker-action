# node-license-checker-action
GitHub action to check licenses on node projects.

See the `entrypoint.sh` for configurable environment variables, things which can be controlled are:
* `ALLOWED_LICENSES` - a comma separated list of license names. Default is in `allowed-licenses.txt`.
* `ALL_OUTPUT_FILE` - where to put the CSV report of all discovered licenses. Defaults to `licenses.csv`. Consider making it a build artifact.
* `DISALLOWED_OUTPUT_FILE` - where to put the CSV report of disallowed licenses. Defaults to `disallowed-licenses.csv`. Consider making it a build artifact.

The arguments to [`license-checker-rseidelsohn`](https://github.com/RSeidelsohn/license-checker-rseidelsohn) can be overriden by adding args to the action.
