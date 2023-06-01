# %fleet
fleet monitoring

- spec: https://gist.github.com/tiller-tolbus/411ea768b4c6110644f1a33a17c0ff3d

- `%fleet` is an urbit application for monitoring a set of sponsored ships. It is intended to be run on a ship that provides value-added sponsor services to other running ships. The primary target audience is stars performing planet services, although in principle it's useful for galaxies performing star services, as well as planets performing moon services.

- `%fleet` initializes by collecting the set of the host ship's sponsees from `%jael`. Periodically, it checks to ensure that the set is up to date. Upon each refresh, new residents are added, and former residents are removed. The default refresh interval is one hour.

- `%fleet` automatically monitors the uptime of each sponsee. It will track the amount of time since the last contact of each ship. If that time exceeds a specified “heartbeat threshold” (default ~m30), `%fleet` will send a message to the `%pongo` inbox of each administrator ship (stewards), to notify of potential downtime, and subsequent reconnection.

## installation
1. clone this repo
2. dojo > `|new-desk %fleet`
3. dojo > `|mount %fleet`
4. terminal > `cp -r /repo/fleet/* /your-ship/fleet/`
5. dojo > `|commit %fleet`
6. dojo > `|install our %fleet`
7. browser > navigate to your ship url and open `fleet` from grid
8. `%fleet` > configure settings
9. `%fleet` > configure stewards (ships to be notified)
