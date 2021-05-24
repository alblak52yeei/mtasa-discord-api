local aWebHooks = { }
local CWebHook = setmetatable( 
{   
        -- Class Constructor
        New = function( self, sChannel )
            self.nickname = Settings[ sChannel ].nickname
            self.webhook_link = Settings[ sChannel ].webhook_link
            self.avatar = Settings[ sChannel ].avatar
            return self
        end,
        --Sending a message
        Send = function( self, message )
            local sendOptions = {
                connectionAttempts = 3,
                connectTimeout = 5000,
                formFields = {
                    content = message:gsub( "#%x%x%x%x%x%x", "" ),
                    username = self.username,
                    avatar_url = self.avatar,
                }
            }
            fetchRemote( self.webhook_link, sendOptions, function( ) end )
        end
    }, {
    -- To call the class as a function.
    __call = function( self, ... )
        return self:New( ... )
    end
} )

function SendMessage( sChannel, sMessage )
    assert( sChannel and type( sChannel == 'string' ), 'Bad argument 1 @ SendMessage (string expected, got '..type( sChannel )..')' )
    assert( sMessage and type( sMessage == 'string' ), 'Bad argument 2 @ SendMessage (string expected, got '..type( sMessage )..')' )
    local self = aWebHooks[ sChannel ]
    if (self and type( self ) == 'table') then
        self:Send( sMessage )
    end
end

addEventHandler( 'onResourceStart', resourceRoot,
    function()
        for info, _ in pairs( Settings ) do
            aWebHooks[ info ] = CWebHook( info );
        end
    end )
