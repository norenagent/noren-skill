# Sandbox

Every task runs in a gVisor container: a user-space kernel sits between the code and the host.

| Limit | Value |
| --- | --- |
| Network | none, no host files, no secrets, no inherited environment |
| CPU | 1 |
| Memory | 128 MB |
| Processes | 32 |
| Disk | 8 MB |
| Time | 10 s |

The folder is deleted afterwards. Only file names and sizes come back.

## Code agent

The code agent writes Python and its tests, runs them in the sandbox, reads the failures and fixes its own code for up to 4 rounds. It never gets a shell and cannot reach the network. Limit: 5 tasks per day per address.

A page it builds is shown in a locked frame (`sandbox="allow-scripts"`, no same-origin): it cannot make network requests, read cookies or touch the host page.

## What to tell the user

State the limits above. Do not promise that code is safe, only that it ran inside those limits.
