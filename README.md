# Hytale Server

Docker image to run a Hytale server.

This was just thrown together. Security and usability will be improved later...

## Installation / Running the server

On first startup, the container first downloads the server downloader, then uses it to download the server files. For this to work you need to authenticate with a Hytale account. The URL you need to visit will be printed in the output of the container, so look at the logs or just attach to it.

Then the server is started. You must again authenticate with your Hytale account to activate the server license. Run `/auth login device` to get a verification link. Then run `/auth persistence Encrypted`, otherwise the activation will be gone after the server is stopped.

### Scripts

For convenience I have some scripts attached:

- `restart.sh` - (re)start the server from the compose file
- `attach.sh` - attach to the server console

## Configuration

The container notably supports the following environment variables:

- `JDK_JAVA_OPTIONS` - interpreted by Java directly as default JVM options
- `SERVER_ARGS` - additional arguments passed to the server on startup

### Server Args

From the `--help` option:

```none
Option                                   Description
------                                   -----------
--accept-early-plugins                   You acknowledge that loading early
                                           plugins is unsupported and may cause
                                           stability issues.
--allow-op
--assets <Path>                          Asset directory (default: ..
                                           /HytaleAssets)
--auth-mode                              Authentication mode (default:
  <authenticated|offline|insecure>         AUTHENTICATED)
-b, --bind <InetSocketAddress>           Port to listen on (default: 0.0.0.0/0.
                                           0.0.0:5520)
--backup
--backup-dir <Path>
--backup-frequency <Integer>             (default: 30)
--backup-max-count <Integer>             (default: 5)
--bare                                   Runs the server bare. For example
                                           without loading worlds, binding to
                                           ports or creating directories.
                                           (Note: Plugins will still be loaded
                                           which may not respect this flag)
--boot-command <String>                  Runs command on boot. If multiple
                                           commands are provided they are
                                           executed synchronously in order.
--client-pid <Integer>
--disable-asset-compare
--disable-cpb-build                      Disables building of compact prefab
                                           buffers
--disable-file-watcher
--disable-sentry
--early-plugins <Path>                   Additional early plugin directories to
                                           load from
--event-debug
--force-network-flush <Boolean>          (default: true)
--generate-schema                        Causes the server generate schema,
                                           save it into the assets directory
                                           and then exit
--help                                   Print's this message.
--identity-token <String>                Identity token (JWT)
--log <KeyValueHolder>                   Sets the logger level.
--migrate-worlds <String>                Worlds to migrate
--migrations <Object2ObjectOpenHashMap>  The migrations to run
--mods <Path>                            Additional mods directories
--owner-name <String>
--owner-uuid <UUID>
--prefab-cache <Path>                    Prefab cache directory for immutable
                                           assets
--session-token <String>                 Session token for Session Service API
--shutdown-after-validate                Automatically shutdown the server
                                           after asset and/or prefab validation.
--singleplayer
-t, --transport <TransportType>          Transport type (default: QUIC)
--universe <Path>
--validate-assets                        Causes the server to exit with an
                                           error code if any assets are invalid.
--validate-prefabs [ValidationOption]    Causes the server to exit with an
                                           error code if any prefabs are
                                           invalid.
--validate-world-gen                     Causes the server to exit with an
                                           error code if default world gen is
                                           invalid.
--version                                Prints version information.
--world-gen <Path>                       World gen directory
```
