//
//  SlashCommandListener.swift
//  
//
//  Created by Noah Pistilli on 2022-01-14.
//

import Foundation
import Swiftcord

class SlashCommandListener: ListenerAdapter {
    override func onSlashCommandEvent(event: SlashCommandEvent) async {
        if event.name == "clear" {
            if event.member!.hasPermission(.banMembers) {
                await clear(event: event)
            } else {
                try! await event.reply(message: "You cannot use that command!")
            }
        }
        else if event.name == "lyrics" {
            await Lyrics().getLyrics(event: event)
        }
        else if event.name == "confessions" {
            await Confessions().sendSuccess(event: event)
        }
    }
}
