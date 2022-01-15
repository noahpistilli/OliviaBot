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
            clear(event: event)
        }
        else if event.name == "lyrics" {
            Lyrics().getLyrics(event: event)
        }
    }
}
