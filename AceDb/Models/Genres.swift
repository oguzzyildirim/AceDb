//
//  MovieGenres.swift
//  PokerDb
//
//  Created by Oğuz Yıldırım on 30.12.2023.
//

import Foundation

enum MovieGenres: Int {
  case action = 28
  case adventure = 12
  case animation = 16
  case comedy = 35
  case crime = 80
  case documentary = 99
  case drama = 18
  case family = 10751
  case fantasy = 14
  case history = 36
  case horror = 27
  case music = 10402
  case mystery = 9648
  case romance = 10749
  case scienceFiction = 878
  case tvMovie = 10770
  case thriller = 53
  case war = 10752
  case western = 37
}

enum TVGenre: Int, CaseIterable {
  case actionAdventure = 10759
  case animation = 16
  case comedy = 35
  case crime = 80
  case documentary = 99
  case drama = 18
  case family = 10751
  case kids = 10762
  case mystery = 9648
  case news = 10763
  case reality = 10764
  case sciFiFantasy = 10765
  case soap = 10766
  case talk = 10767
  case warPolitics = 10768
  case western = 37
}
