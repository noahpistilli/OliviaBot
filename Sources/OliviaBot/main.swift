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

}

let messageLogger = MessageLogger(bot: bot)
messageLogger.messageLogger()
slashCommandListener()
buttonClick()

bot.connect()

