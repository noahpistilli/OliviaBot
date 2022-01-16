import Sword

let options = ShieldOptions(prefixes: ["o-"])
let bot = Shield(token: "ODcyMzExMzYyNjk1NjE0NDg0.YQoBQw.ejrqNbXXUHOZuN4FrpZOojvTfMM", shieldOptions: options)

bot.setIntents(intents: .guilds, .guildMembers, .guildMessages)

let activity = Activities(name: "SOUR Prom", type: .watching)

bot.editStatus(status: .online, activity: activity)


let messageLogger = MessageLogger(bot: bot)
messageLogger.messageLogger()
slashCommandListener()
buttonClick()

bot.connect()
