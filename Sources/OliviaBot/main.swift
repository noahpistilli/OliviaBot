import Sword

let options = ShieldOptions(prefixes: ["o-"])
let bot = Shield(token: "ODcyMzExMzYyNjk1NjE0NDg0.YQoBQw.ejrqNbXXUHOZuN4FrpZOojvTfMM", shieldOptions: options)

bot.setIntents(intents: .guildMessages, .guilds, .guildMembers)

let activity = Activities(name: "SOUR Prom", type: .watching)

bot.editStatus(status: .online, activity: activity)

bot.on(.messageCreate) { data in
    let msg = data as! Message
    
    /*if msg.content == "+embed" {
        var slash = SlashCommandBuilder(name: "clear", description: "Clears a specified amount of messages from chat.")
        
        slash.addOption(option: ApplicationCommandOptions(name: "amount", description: "Number of messages to clear", type: .int))
        
        msg.guild?.uploadSlashCommand(commandData: slash)
    }*/
    
    if msg.content == "+embed" {
        let embed = EmbedBuilder()
            .setTitle(title: "Ping Settings")
            .setDescription(description: "Welcome to the Ping Settings channel! Here, you can subscribe to pings you are interested in, and unsubscribe from pings you are not interested in. This is to help reduce @​everyone pings. However, when a major event happens such as a new album or song, we will ping @everyone\n\nClick the buttons below to subscribe to different pings.\nClick the buttons again to remove that role.")
            .addField(":ping_pong: Server Updates", value: "These are mainly for updates to our server.  Let's say we have new bots, or we're hosting a special event or a Game Night. If you are interested in this, these are some pings you would like to subscribe to!", isInline: false)
            .addField("<:Sourbf:931405204220424262> General Olivia Updates", value: "Updates on Olivia such as awards, nominations and anything that isn't new music as well will ping everyone for that.", isInline: false)
        
        let buttonBuilder = ButtonBuilder(embed: embed)
            .addComponent(component:
                            ActionRow(components:
                                        Button(customId: "server_updates", style: .green, label: "Server Updates"),
                                      Button(customId: "general_liv_updates", style: .green, label: "General Olivia Updates")
                                     )
            )
        
        msg.reply(with: buttonBuilder)
    }
}

let messageLogger = MessageLogger(bot: bot)
messageLogger.messageLogger()
slashCommandListener()

bot.connect()

