import Swiftcord

let bot = Swiftcord(token: "token")

bot.setIntents(intents: .guildMembers, .guildMessages)

let activity = Activities(name: "SOUR Prom", type: .watching)

bot.editStatus(status: .online, activity: activity)

let messageLogger = MessageLogger(bot: bot)
bot.addListeners(ButtonClickListener(), JoinLogger(), messageLogger, SlashCommandListener())

bot.connect()
