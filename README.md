# mtasa-discord-api
A resource that allows you to send messages to discord directly from the MTA.

**Documentation**

In the ShDiscord.lua file in the Settings array, webhook_link is a link to Discord WebHook, avatar is a link to an avatar, nickname is the name of the bot from which messages will be sent.

Send message (Server side only):
```lua
  -- Both export:
  exports["mtasa-discord-api"]:SendMessage( sChannel, sMessage )
  -- or so
  exports.mtasa-discord-api:SendMessage( sChannel, sMessage )
```
