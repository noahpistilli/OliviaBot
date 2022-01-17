//
//  SlashCommandListener.swift
//  
//
//  Created by Noah Pistilli on 2022-01-14.
//

import Foundation
import Sword

func slashCommandListener() {
    bot.on(.slashCommandEvent) { data in
        let event = data as! SlashCommandEvent
            
        if event.name == "clear" {
            if event.member!.hasPermission(.banMembers) {
                clear(event: event)
            } else {
                event.reply(message: "You cannot use that command!")
            }
        }
        else if event.name == "lyrics" {
            Lyrics().getLyrics(event: event)
        }
        else if event.name == "confessions" {
            Confessions().sendSuccess(event: event)
        }
    }
}
