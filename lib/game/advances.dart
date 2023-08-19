import 'package:mega_empires_assistant/data/advance.dart';
import 'package:mega_empires_assistant/data/advance_colour.dart';

/// All advances available in the game.
final Set<Advance> allAdvances = {
  Advance(
      colour1: AdvanceColour.yellow,
      price: 60,
      title: "Mythology",
      positiveEffects: [
        CalamityEffect(
            "Slave Revolt",
            "Your city support rate is decreased by 1 during the resolution "
                "of Slave Revolt.")
      ],
      points: 1,
      discounts: {AdvanceColour.blue: 5, AdvanceColour.yellow: 10},
      specificDiscount: SpecificDiscount("Literacy", 10)),
  Advance(
      colour1: AdvanceColour.yellow,
      price: 70,
      title: "Deism",
      positiveEffects: [CalamityEffect("Superstition", "Reduce 1 less city.")],
      points: 1,
      discounts: {AdvanceColour.yellow: 10, AdvanceColour.orange: 5},
      specificDiscount: SpecificDiscount("Fundamentalism", 10)),
  Advance(
      colour1: AdvanceColour.yellow,
      price: 150,
      title: "Fundamentalism",
      notes: [
        "You may choose to destroy all units in an area adjacent by land to "
            "your units. Barbarian tokens, pirate cities and units belonging "
            "to players holding Fundamentalism or Philosophy are unaffected."
      ],
      negativeEffects: [
        CalamityEffect(
            "Regression", "Your marker is moved backward 1 additional step.")
      ],
      points: 3,
      discounts: {AdvanceColour.blue: 5, AdvanceColour.yellow: 10},
      specificDiscount: SpecificDiscount("Monotheism", 20)),
  Advance(
      colour1: AdvanceColour.yellow,
      price: 160,
      title: "Universal Doctrine",
      description: "",
      specialAbilities: [
        "You may choose to annex 1 pirate city or up to 5 barbarian tokens "
            "anywhere on the board."
      ],
      notes: ["The barbarian tokens may be selected from more than 1 area."],
      negativeEffects: [
        CalamityEffect("Superstition", "Reduce 1 additional city.")
      ],
      points: 3,
      discounts: {AdvanceColour.yellow: 10, AdvanceColour.red: 5},
      specificDiscount: SpecificDiscount("Theology", 20)),
  Advance(
      colour1: AdvanceColour.yellow,
      price: 160,
      title: "Enlightenment",
      positiveEffects: [
        CalamityEffect("Superstition", "Reduce 1 less city."),
        CalamityEffect(
            "Slave Revolt",
            "Your city support rate is decreased by 1 during the resolution "
                "of Slave Revolt."),
        CalamityEffect(
            "Epidemic", "If you are the primary victim, prevent 5 damage."),
        CalamityEffect(
            "Regression",
            "For each step backward, you may choose to prevent the effect by "
                "destroying 2 of your cities (if possible non-coastal).")
      ],
      points: 3,
      discounts: {AdvanceColour.yellow: 10, AdvanceColour.orange: 5},
      specificDiscount: SpecificDiscount("Philosophy", 20)),
  Advance(
      colour1: AdvanceColour.yellow,
      price: 240,
      title: "Monotheism",
      specialAbilities: [
        "You may choose to annex all units in an area adjacent by land to "
            "your units. Barbarian tokens, pirate cities and units belonging"
            " to players holding Monotheism or Theology are unaffected."
      ],
      notes: [
        "If you have insufficient units in stock to annex all units in the"
            " area to start with, you cannot select this area.",
        "If you annex an area containing a city and a token (due to "
            "'Public Works') or more tokens than the population limit "
            "allows (due to 'Agriculture'), the extra token must also be "
            "annexed, even if you don't also hold any of these advances. In "
            "this case it will be destroyed during the next 'Remove surplus "
            "population' phase."
      ],
      negativeEffects: [
        CalamityEffect("Iconoclasm and Heresy", "Reduce 1 additional city.")
      ],
      points: 6,
      discounts: {AdvanceColour.yellow: 20, AdvanceColour.red: 5}),
  Advance(
      colour1: AdvanceColour.yellow,
      price: 250,
      title: "Theology",
      description: "Your units are protected against the effect of Monotheism.",
      positiveEffects: [
        CalamityEffect("Iconoclasm and Heresy", "Reduce 3 less cities.")
      ],
      points: 6,
      discounts: {AdvanceColour.yellow: 20, AdvanceColour.green: 5}),
  Advance(
      colour1: AdvanceColour.yellow,
      price: 270,
      title: "Diaspora",
      specialAbilities: [
        "You may choose to take up to 5 of your tokens from the board and "
            "place them anywhere else on the board, providing that no "
            "population limits are exceeded."
      ],
      notes: [
        "Placing a token in an area containing a city is not allowed, except "
            "for your own city if you hold 'Public Works'.",
        "In areas that only contain your tokens the effect of 'Agriculture' "
            "may be used."
      ],
      points: 6,
      discounts: {AdvanceColour.blue: 5, AdvanceColour.yellow: 20}),
  Advance(
      colour1: AdvanceColour.green,
      price: 60,
      title: "Empiricism",
      points: 1,
      discounts: {
        AdvanceColour.blue: 5,
        AdvanceColour.yellow: 5,
        AdvanceColour.orange: 5,
        AdvanceColour.red: 5,
        AdvanceColour.green: 10
      },
      specificDiscount: SpecificDiscount("Medicine", 10)),
  Advance(
      colour1: AdvanceColour.green,
      price: 80,
      title: "Astronavigation",
      description: "Your ships are allowed to move through open sea areas.",
      notes: ["Your ships may not end in an open sea area."],
      points: 1,
      discounts: {AdvanceColour.yellow: 5, AdvanceColour.green: 10},
      specificDiscount: SpecificDiscount("Calendar", 10)),
  Advance(
      colour1: AdvanceColour.green,
      price: 90,
      title: "Coinage",
      description: "You may choose to increase or decrease your tax rate by 1.",
      notes: [
        "You may only set a single tax rate for all of your cities.",
        "The tax rate effects of 'Coinage' and 'Monarchy' are cumulative.",
        "If an increase in tax rate would result in a tax revolt, you may "
            "still choose to do so."
      ],
      negativeEffects: [
        CalamityEffect(
            "Corruption", "Discard 5 additional points of face value.")
      ],
      points: 1,
      discounts: {AdvanceColour.red: 5, AdvanceColour.green: 10},
      specificDiscount: SpecificDiscount("Trade Routes", 10)),
  Advance(
      colour1: AdvanceColour.green,
      price: 140,
      title: "Medicine",
      positiveEffects: [CalamityEffect("Epidemic", "Prevent 5 damage.")],
      points: 3,
      discounts: {AdvanceColour.orange: 5, AdvanceColour.green: 10},
      specificDiscount: SpecificDiscount("Anatomy", 20)),
  Advance(
      colour1: AdvanceColour.green,
      price: 160,
      title: "Cartography",
      description: "During the Trade cards acquisition phase, you may acquire "
          "additional trade cards from stack 2 for 5 treasury tokens "
          "and/or from stack 7 for 13 treasury tokens per card.",
      negativeEffects: [
        CalamityEffect(
            "Piracy",
            "If you are the primary victim, the beneficiary selects and "
                "replaces 1 additional coastal city.")
      ],
      points: 3,
      discounts: {AdvanceColour.blue: 5, AdvanceColour.green: 10},
      specificDiscount: SpecificDiscount("Library", 20)),
  Advance(
      colour1: AdvanceColour.green,
      price: 180,
      title: "Calendar",
      notes: [
        "If you are a victim of Cyclone, you must first select the required "
            "number of affected cities by flipping the cities "
            "(either 1, 2 or 3). If you hold 'Trade Empire' this number is "
            "increased by 1. If you have insufficient cities directly "
            "adjacent to the affected open sea area, you select all of "
            "those cities. Calendar subsequently permits you to deselect "
            "up to 2 of your selected cities. Then you must reduce all "
            "your remaining selected cities (if any)."
      ],
      positiveEffects: [
        CalamityEffect("Famine", "Prevent 5 damage."),
        CalamityEffect("Cyclone", "Reduce 2 less selected cities.")
      ],
      points: 3,
      discounts: {AdvanceColour.red: 5, AdvanceColour.green: 10},
      specificDiscount: SpecificDiscount("Public Works", 20)),
  Advance(
      colour1: AdvanceColour.green,
      price: 220,
      title: "Library",
      description:
          "You may discount the cost of 1 other Civilization Advance that "
          "you purchase in the same turn as Library by 40 points.",
      positiveEffects: [
        CalamityEffect(
            "Regression", "Your marker is moved backward 1 step less.")
      ],
      points: 6,
      discounts: {AdvanceColour.blue: 5, AdvanceColour.green: 20}),
  Advance(
      colour1: AdvanceColour.green,
      price: 270,
      title: "Anatomy",
      description:
          "Upon purchase, you may choose to acquire 1 science card with "
          "an undiscounted cost price of less than 100 for free.",
      positiveEffects: [
        CalamityEffect(
            "Epidemic", "If you are a secondary victim, prevent 5 damage.")
      ],
      points: 6,
      discounts: {AdvanceColour.orange: 5, AdvanceColour.green: 20}),
  Advance(
      colour1: AdvanceColour.red,
      price: 50,
      title: "Urbanism",
      description: "Once per turn, when constructing a wilderness city you may "
          "choose to use up to 4 tokens from areas adjacent by land.",
      notes: [
        "In combination with 'Architecture' this means a wilderness city "
            "can be built in an area containing 2 tokens, using 4 tokens "
            "from adjacent areas and 6 tokens from treasury."
      ],
      points: 1,
      discounts: {AdvanceColour.red: 10, AdvanceColour.green: 5},
      specificDiscount: SpecificDiscount("Diplomacy", 10)),
  Advance(
      colour1: AdvanceColour.red,
      price: 60,
      title: "Monarchy",
      description: "You may choose to increase your tax rate by 1.",
      notes: [
        "You may only set a single tax rate for all of your cities.",
        "The tax rate effects of 'Monarchy' and 'Coinage' are cumulative.",
        "If an increase in tax rate would result in a tax revolt, you may "
            "still choose to do so."
      ],
      positiveEffects: [
        CalamityEffect("Barbarian Hordes", "5 less barbarian tokens are used.")
      ],
      negativeEffects: [
        CalamityEffect("Tyranny",
            "The beneficiary selects and annexes 5 additional unit points.")
      ],
      points: 1,
      discounts: {AdvanceColour.yellow: 5, AdvanceColour.red: 10},
      specificDiscount: SpecificDiscount("Law", 10)),
  Advance(
      colour1: AdvanceColour.red,
      price: 150,
      title: "Law",
      positiveEffects: [
        CalamityEffect("Tyranny",
            "The beneficiary selects and annexes 5 less unit points."),
        CalamityEffect("Civil Disorder", "Reduce 1 less city."),
        CalamityEffect("Corruption", "Discard 5 less points of face value.")
      ],
      points: 3,
      discounts: {AdvanceColour.yellow: 5, AdvanceColour.red: 10},
      specificDiscount: SpecificDiscount("Cultural Ascendancy", 20)),
  Advance(
      colour1: AdvanceColour.red,
      price: 160,
      title: "Naval Warfare",
      description:
          "Your ships are allowed to carry 6 tokens. In conflicts, you may "
          "choose to remove ships from the conflict area instead of "
          "tokens. After each round of token removal a new check for "
          "token majority must be made.",
      notes: [
        "In conflict, while checking for token majority, your ships are not "
            "counted. Because you can remove a ship rather than a token each "
            "round, this token balance may change every round of removal. "
            "Therefore a new check for majority has to be made each round.",
        "Even if you hold ‘Naval Warfare’, moving your ships into an area "
            "(with or without tokens), is not considered to be causing conflict"
            " or attacking, while disembarking tokens may actually be. In an "
            "area containing only your ship and 1 or more enemy tokens or a "
            "city, your ship itself does not cause conflict.",
        "An enemy token in an area containing only your ship (none of your "
            "tokens) is not causing conflict here due to your ship.",
        "When attacking a city, a ship does not count for the minimum of 7 "
            "tokens; you still require sufficient tokens. However, during "
            "conflict resolution you may remove your ships as losses if the "
            "attack is successful.",
        "If your city attack is unsuccessful, all of your ships in this area "
            "are destroyed as well.",
        "f you hold both ‘Advanced Military’ and ‘Naval Warfare’, you cannot "
            "remove ships from areas adjacent to the conflict area."
      ],
      positiveEffects: [
        CalamityEffect(
            "Piracy",
            "If you are the primary victim, the beneficiary selects and "
                "replaces 1 less coastal city. You may not be selected as "
                "a secondary victim.")
      ],
      negativeEffects: [
        CalamityEffect("Civil Disorder", "Reduce 1 additional city.")
      ],
      points: 3,
      discounts: {AdvanceColour.orange: 5, AdvanceColour.red: 10},
      specificDiscount: SpecificDiscount("Diaspora", 20)),
  Advance(
      colour1: AdvanceColour.red,
      price: 170,
      title: "Military",
      description: "Your movement phase is after all other players not holding "
          "Military have moved. You are allowed to move tokens into "
          "areas containing cities belonging to players holding Diplomacy.",
      notes: [
        "If more than 1 player holds 'Military', for these players their "
            "mutual order is again defined by their census."
      ],
      negativeEffects: [
        CalamityEffect("Civil War", "Select 5 additional unit points.")
      ],
      points: 3,
      discounts: {AdvanceColour.orange: 5, AdvanceColour.red: 10},
      specificDiscount: SpecificDiscount("Advanced Military", 20)),
  Advance(
      colour1: AdvanceColour.red,
      price: 220,
      title: "Democracy",
      description:
          "During the Tax collection phase you collect tax as usual but "
          "your cities do not revolt as a result of a shortage in "
          "tax collection.",
      notes: [
        "If an increase in tax rate would result in a tax revolt, you may "
            "still choose to do so. If this would happen you can still "
            "become the beneficiary of another player’s tax revolt that turn."
      ],
      positiveEffects: [
        CalamityEffect("Civil War", "Select 10 less unit points."),
        CalamityEffect("Civil Disorder", "Reduce 1 less city.")
      ],
      points: 6,
      discounts: {AdvanceColour.blue: 5, AdvanceColour.red: 20}),
  Advance(
      colour1: AdvanceColour.red,
      price: 230,
      title: "Public Works",
      description: "Areas containing your cities may also contain 1 of your "
          "tokens.\n\nYou are protected against the effect of Provincial "
          "Empire.",
      notes: [
        "Tokens in areas with a city expand as normal.",
        "If your city is annexed or destroyed due to a tax revolt or calamity"
            " the additional token is destroyed.",
        "When building a city, only if you use more than the required tokens "
            "from the map board, you may leave 1 token in the area.",
        "If you reduce a city containing the additional token you must "
            "immediately count the extra token as population and thus replace "
            "the city with 1 token less than normal.",
        "'Agriculture' does not allow you to keep more than 1 token in an "
            "area containing your city.",
        "If a special ability mentions destroying or annexing all units in "
            "an area containing your city, the additional token must also be"
            " annexed or destroyed."
      ],
      points: 6,
      discounts: {AdvanceColour.orange: 5, AdvanceColour.red: 20}),
  Advance(
      colour1: AdvanceColour.red,
      price: 240,
      title: "Advanced Military",
      description:
          "In conflicts, you may choose to remove tokens from areas adjacent "
          "by land. After each round of token removal a new check for "
          "token majority must be made. You may decide to wait for other "
          "token conflicts to be resolved first.\n\nYou are allowed to "
          "cause conflict in areas containing units belonging to players "
          "holding Cultural Ascendancy.",
      notes: [
        "In conflict the token balance may change after every round of "
            "removal as you can remove tokens from different areas instead "
            "of the conflict area. A new check for token majority must be "
            "made each round.",
        "A player holding 'Advanced Military' may wait before resolving "
            "token conflicts in which he is involved, in order to choose "
            "where to remove his tokens (or ships, if he also holds ‘Naval "
            "Warfare’). If more than 1 player involved holds "
            "'Advanced Military', the player with the lowest A.S.T.-ranking "
            "(highest Civilization #) order may wait for players with a "
            "higher order (lowest #).",
        "Players are not allowed to reduce a city in order to provide "
            "themselves with more tokens in conflict.",
        "If you unsuccessfully attack a city, the tokens that are destroyed "
            "from the area may not be removed from an adjacent area instead."
      ],
      negativeEffects: [
        CalamityEffect("Civil Disorder", "Reduce 1 additional city")
      ],
      points: 6,
      discounts: {AdvanceColour.red: 20, AdvanceColour.green: 5}),
  Advance(
      colour1: AdvanceColour.red,
      price: 260,
      title: "Provincial Empire",
      specialAbilities: [
        "You may choose to select up to 5 players that have units adjacent "
            "by land or water to your units. These players must choose and "
            "give you a commodity card with a face value of at least 2. "
            "Players holding Provincial Empire or Public Works may not be "
            "selected."
      ],
      notes: [
        "The victims may choose whether they give their cards face up or "
            "down. You may choose whether you reveal them."
      ],
      negativeEffects: [
        CalamityEffect(
            "Barbarian Hordes", "5 additional barbarian tokens are used."),
        CalamityEffect("Tyranny",
            "The beneficiary selects and annexes 5 additional unit points.")
      ],
      points: 6,
      discounts: {AdvanceColour.yellow: 5, AdvanceColour.red: 20}),
  Advance(
      colour1: AdvanceColour.blue,
      price: 80,
      title: "Music",
      positiveEffects: [
        CalamityEffect("Civil War", "Select 5 less unit points."),
        CalamityEffect("Civil Disorder", "Reduce 1 less city.")
      ],
      points: 1,
      discounts: {AdvanceColour.blue: 10, AdvanceColour.yellow: 5},
      specificDiscount: SpecificDiscount("Enlightenment", 10)),
  Advance(
      colour1: AdvanceColour.blue,
      price: 130,
      title: "Rhetoric",
      description: "During the Trade cards acquisition phase, you may acquire "
          "additional trade cards from stack 3 for 9 treasury tokens "
          "per card.",
      points: 3,
      discounts: {AdvanceColour.blue: 10, AdvanceColour.red: 5},
      specificDiscount: SpecificDiscount("Politics", 20)),
  Advance(
      colour1: AdvanceColour.blue,
      price: 140,
      title: "Architecture",
      description:
          "Once per turn, when constructing a city, you may choose to pay up "
          "to half of the required number of tokens from treasury.",
      notes: [
        "You are allowed to use the ability when building a wilderness city."
      ],
      points: 3,
      discounts: {AdvanceColour.blue: 10, AdvanceColour.green: 5},
      specificDiscount: SpecificDiscount("Mining", 20)),
  Advance(
      colour1: AdvanceColour.blue,
      price: 160,
      title: "Diplomacy",
      description:
          "Players are not allowed to move tokens into areas containing "
          "your cities, except for areas where a conflict situation "
          "already occurs. This does not count for players holding "
          "Diplomacy or Military.",
      notes: [
        "Barbarian tokens are unaffected by 'Diplomacy'.",
        "Placing tokens during population expansion, annexation, Special "
            "abilities phase or moving ships into an area without "
            "disembarking tokens is not considered attacking or causing "
            "conflict.",
        "If a player holding ‘Military’ moves a single token into an area "
            "containing your city, this is considered 'attacking the city'. "
            "After he moved (and the token stays there), other players may "
            "move tokens into this area, even if they don’t hold 'Military', "
            "because at this point a 'conflict situation' already occurs in "
            "this area."
      ],
      negativeEffects: [
        CalamityEffect("Treachery",
            "The beneficiary selects and annexes 1 additional city.")
      ],
      points: 3,
      discounts: {AdvanceColour.blue: 10, AdvanceColour.red: 5},
      specificDiscount: SpecificDiscount("Provincial Empire", 20)),
  Advance(
      colour1: AdvanceColour.blue,
      price: 230,
      title: "Politics",
      specialAbilities: [
        "You may choose 1 of 2 options: 1) Gain up to 5 treasury tokens "
            "from stock. 2) Annex all units in an area adjacent by land to "
            "your units. Pay treasury tokens equal to the number of unit "
            "points annexed, or the effect is canceled. Barbarian tokens, "
            "pirate cities and units belonging to players holding Politics "
            "or Cultural Ascendancy are unaffected."
      ],
      notes: [
        "If you have insufficient units in stock or treasury to annex all "
            "units in the area to start with, you cannot select this area.",
        "If you annex an area containing a city and a token (due to "
            "'Public Works') or more tokens than the population limit "
            "allows (due to 'Agriculture'), the extra token must also be "
            "annexed (and be paid for), even if you do not also hold any of "
            "these advances. In this case it will be destroyed during the "
            "next 'Remove surplus population' phase.",
        "The treasury tokens paid are put into your own stock. The treasury "
            "of the victim is unaffected."
      ],
      negativeEffects: [
        CalamityEffect(
            "Barbarian Hordes", "5 additional barbarian tokens are used.")
      ],
      points: 6,
      discounts: {AdvanceColour.blue: 20, AdvanceColour.yellow: 5}),
  Advance(
      colour1: AdvanceColour.blue,
      price: 280,
      title: "Cultural Ascendancy",
      description:
          "Players are not allowed to cause conflict in areas containing "
          "your units, except for areas where a conflict situation "
          "already occurs. This does not count for players holding "
          "Cultural Ascendancy or Advanced Military.\n\nYour units are "
          "protected against the effect of Politics.\n\nYour default "
          "city support rate is increased by 1.",
      notes: [
        "Barbarian tokens are unaffected by 'Cultural Ascendancy'.",
        "Placing tokens during population expansion, annexation, Special "
            "abilities phase or moving ships in an area without disembarking "
            "tokens is not considered attacking or causing conflict.",
        "An opponent moving a single token in an area that would result in "
            "conflict if it stays there is considered 'causing a conflict', "
            "even if in case of a city attack the attack would be unsuccessful.",
        "Attacking a city is considered 'causing conflict', even if the "
            "attack is performed by a single token.",
        "If a player holding 'Advanced Military' moves a single token into "
            "an area containing your city, this is considered 'attacking the "
            "city'. After he moved (and the token stays there), other players "
            "may move tokens into this area, even if they don’t hold "
            "'Advanced Military', because at this point a 'conflict situation' "
            "already occurs in this area.",
        "At any moment a check is made for city support (including the "
            "resolution of Slave Revolt) you must have an additional token on "
            "the map board for each of your cities. When you purchase "
            "'Cultural Ascendancy' there is no check for city support. The "
            "first time a check is made is during the City construction phase."
      ],
      points: 6,
      discounts: {AdvanceColour.blue: 20, AdvanceColour.yellow: 5}),
  Advance(
      colour1: AdvanceColour.blue,
      price: 50,
      title: "Sculpture",
      positiveEffects: [
        CalamityEffect("Tyranny",
            "The beneficiary selects and annexes 5 less unit points.")
      ],
      points: 1,
      discounts: {AdvanceColour.blue: 10, AdvanceColour.red: 5},
      specificDiscount: SpecificDiscount("Architecture", 10)),
  Advance(
      colour1: AdvanceColour.blue,
      price: 80,
      title: "Drama And Poetry",
      positiveEffects: [
        CalamityEffect("Civil War", "Select 5 less unit points."),
        CalamityEffect("Civil Disorder", "Reduce 1 less city.")
      ],
      points: 1,
      discounts: {AdvanceColour.blue: 10, AdvanceColour.yellow: 5},
      specificDiscount: SpecificDiscount("Rhetoric", 10)),
  Advance(
      colour1: AdvanceColour.orange,
      price: 50,
      title: "Cloth Making",
      description: "Your ships are allowed to move 5 steps.",
      points: 1,
      discounts: {AdvanceColour.blue: 5, AdvanceColour.orange: 10},
      specificDiscount: SpecificDiscount("Naval Warfare", 10)),
  Advance(
      colour1: AdvanceColour.orange,
      price: 60,
      title: "Masonry",
      notes: [
        "If you are a victim of Cyclone, you must first select the required "
            "number of affected cities by flipping the cities (either 1, 2 "
            "or 3). If you hold 'Trade Empire' this number is increased by 1. "
            "If you have insufficient cities directly adjacent to the "
            "affected open sea area, you select all of those cities. "
            "'Masonry' subsequently permits you to deselect 1 of your "
            "selected cities. Then you must reduce all your remaining "
            "selected cities (if any)."
      ],
      positiveEffects: [
        CalamityEffect("Cyclone", "Reduce 1 less of your selected cities.")
      ],
      points: 1,
      discounts: {AdvanceColour.orange: 10, AdvanceColour.green: 5},
      specificDiscount: SpecificDiscount("Engineering", 10)),
  Advance(
      colour1: AdvanceColour.orange,
      price: 60,
      title: "Pottery",
      positiveEffects: [CalamityEffect("Famine", "Prevent 5 damage.")],
      points: 1,
      discounts: {AdvanceColour.blue: 5, AdvanceColour.orange: 10},
      specificDiscount: SpecificDiscount("Agriculture", 10)),
  Advance(
      colour1: AdvanceColour.orange,
      price: 90,
      title: "Metalworking",
      description:
          "In conflicts, for each round of token removal all other players "
          "not holding Metalworking must remove their token first.",
      notes: [
        "If more than 1 player holds 'Metalworking', their mutual order is "
            "again the normal minority/majority order."
      ],
      points: 1,
      discounts: {AdvanceColour.orange: 10, AdvanceColour.red: 5},
      specificDiscount: SpecificDiscount("Military", 10)),
  Advance(
      colour1: AdvanceColour.orange,
      price: 120,
      title: "Agriculture",
      description:
          "The population limit of ‘0’, ‘1’ and ‘2’ areas on the board is "
          "increased by 1 for you as long as these areas do not contain "
          "any other player’s units or barbarian tokens.",
      notes: [
        "'Agriculture' does not allow you to build a city in an area with "
            "population limit '0'.",
        "When reducing a city,you may immediately use the effect and thus "
            "place the additional token.",
        "In conflict, as soon as you are the only player occupying the area "
            "(and the conflict ends), you may immediately use the effect and "
            "thus keep the additional token if present",
        "The effect of 'Agriculture' does not apply to areas containing "
            "cities in combination with the effect of 'Public Works'."
      ],
      negativeEffects: [
        CalamityEffect("Famine",
            "If you are the primary victim, take 5 additional damage.")
      ],
      points: 3,
      discounts: {AdvanceColour.orange: 10, AdvanceColour.green: 5},
      specificDiscount: SpecificDiscount("Democracy", 20)),
  Advance(
      colour1: AdvanceColour.orange,
      price: 180,
      title: "Trade Routes",
      specialAbilities: [
        "You may choose to discard any number of commodity cards to gain "
            "treasury tokens at twice the face value of the commodity cards "
            "discarded this way."
      ],
      notes: [
        "You cannot gain less treasury than exactly twice the face value of "
            "a commodity card. If you have insufficient tokens in stock you "
            "cannot discard this card."
      ],
      points: 3,
      discounts: {AdvanceColour.yellow: 5, AdvanceColour.orange: 10},
      specificDiscount: SpecificDiscount("Trade Empire", 20)),
  Advance(
      colour1: AdvanceColour.orange,
      price: 220,
      title: "Roadbuilding",
      description:
          "When moving over land, your tokens may move 2 areas. Tokens that "
          "are in a conflict situation after 1 step are not allowed to "
          "move any further. Your hand limit of trade cards is increased "
          "by 1.",
      notes: [
        "For each of your tokens, if you choose to move 2 steps, you must do "
            "so in one go and then flip the token. This second step may not "
            "be made before or after embarking a ship. If a token is in a "
            "'conflict situation' after the first of 2 steps, you may not "
            "move this token a second step.This second step may end in a "
            "'conflict situation'.",
        "Attacking a city is considered 'causing conflict' or being in a "
            "'conflict situation', even if the attack is performed by a "
            "single token."
      ],
      negativeEffects: [
        CalamityEffect("Epidemic",
            "If you are the primary victim, take 5 additional damage.")
      ],
      points: 6,
      discounts: {AdvanceColour.orange: 20, AdvanceColour.green: 5}),
  Advance(
      colour1: AdvanceColour.orange,
      price: 230,
      title: "Mining",
      description: "During the Trade cards acquisition phase, you may acquire "
          "additional trade cards from stack 6 and/or stack 8 for "
          "13 treasury tokens per card.\n\nTreasury tokens are worth "
          "2 points when purchasing Civilization Advances.",
      notes: [
        // TODO: This isn't enforced in the app
        "When using treasury tokens to purchase Civilization Advances you "
            "may exceed the purchase price by exactly 1 this way."
      ],
      negativeEffects: [
        CalamityEffect(
            "Slave Revolt",
            "Your city support rate is increased by 1 during the resolution "
                "of Slave Revolt.")
      ],
      points: 6,
      discounts: {AdvanceColour.orange: 20, AdvanceColour.green: 5}),
  Advance(
      colour1: AdvanceColour.orange,
      price: 260,
      title: "Trade Empire",
      description:
          "Once per turn, you may choose to use 1 substitute commodity card "
          "of at least the same face value when turning in an incomplete "
          "set of commodity cards.",
      negativeEffects: [
        CalamityEffect("Cyclone",
            "Select and reduce 1 additional city adjacent to the open sea area."),
        CalamityEffect("Epidemic",
            "If you are the primary victim, take 5 additional damage.")
      ],
      points: 6,
      discounts: {AdvanceColour.orange: 20, AdvanceColour.red: 5}),
  Advance(
      colour1: AdvanceColour.blue,
      colour2: AdvanceColour.yellow,
      price: 50,
      title: "Mysticism",
      positiveEffects: [CalamityEffect("Superstition", "Reduce 1 less city.")],
      points: 1,
      discounts: {AdvanceColour.blue: 5, AdvanceColour.yellow: 5},
      specificDiscount: SpecificDiscount("Monument", 10)),
  Advance(
      colour1: AdvanceColour.red,
      colour2: AdvanceColour.green,
      price: 60,
      title: "Written Record",
      description:
          "Acquire 10 additional points of credit tokens in any combination "
          "of colors.",
      notes: [
        "You gain and choose the color(s) of the additional credit tokens "
            "at the time 'Written Record' is purchased. Your decision cannot "
            "be changed at a later stage."
      ],
      points: 1,
      discounts: {AdvanceColour.red: 5, AdvanceColour.green: 5},
      specificDiscount: SpecificDiscount("Cartography", 10)),
  Advance(
      colour1: AdvanceColour.red,
      colour2: AdvanceColour.yellow,
      price: 80,
      title: "Theocracy",
      notes: [
        "Using this ability prevents your cities from being reduced, but "
            "does not cancel the secondary effects of Iconoclasm and Heresy "
            "if you are the primary victim.",
        "Water commodity cards may be used."
      ],
      positiveEffects: [
        CalamityEffect(
            "Iconoclasm and Heresy",
            "You may choose and discard 2 commodity cards to prevent the "
                "city reduction effect for you.")
      ],
      points: 1,
      discounts: {AdvanceColour.yellow: 5, AdvanceColour.red: 5},
      specificDiscount: SpecificDiscount("Universal Doctrine", 10)),
  Advance(
      colour1: AdvanceColour.blue,
      colour2: AdvanceColour.red,
      price: 110,
      title: "Literacy",
      points: 3,
      discounts: {
        AdvanceColour.blue: 10,
        AdvanceColour.yellow: 5,
        AdvanceColour.orange: 5,
        AdvanceColour.red: 10,
        AdvanceColour.green: 5
      },
      specificDiscount: SpecificDiscount("Mathematics", 20)),
  Advance(
      colour1: AdvanceColour.orange,
      colour2: AdvanceColour.green,
      price: 160,
      title: "Engineering",
      description:
          "Other players or barbarians require 8 tokens to successfully "
          "attack your cities. Your cities are then replaced with 7 "
          "tokens. This does not apply when the attacking player also "
          "holds Engineering.\n\nYou require 6 tokens to successfully "
          "attack other player’s cities or pirate cities. Their cities "
          "are then replaced with 5 tokens. This does not apply when the "
          "defending player also holds Engineering.",
      positiveEffects: [
        CalamityEffect(
            "Earthquake", "Your city is reduced instead of destroyed."),
        CalamityEffect("Flood", "Prevent 5 damage.")
      ],
      points: 3,
      discounts: {AdvanceColour.orange: 10, AdvanceColour.green: 10},
      specificDiscount: SpecificDiscount("Roadbuilding", 20)),
  Advance(
      colour1: AdvanceColour.orange,
      colour2: AdvanceColour.yellow,
      price: 180,
      title: "Monument",
      description:
          "Acquire 20 additional points of credit tokens in any combination "
          "of colors.",
      notes: [
        "You gain and choose the color(s) of the additional credit tokens at "
            "the time 'Monument' is purchased. Your decision cannot be "
            "changed at a later stage."
      ],
      points: 3,
      discounts: {AdvanceColour.yellow: 10, AdvanceColour.orange: 10},
      specificDiscount: SpecificDiscount("Wonder Of The World", 20)),
  Advance(
      colour1: AdvanceColour.yellow,
      colour2: AdvanceColour.green,
      price: 220,
      title: "Philosophy",
      description:
          "Your units are protected against the effect of Fundamentalism.",
      positiveEffects: [
        CalamityEffect("Iconoclasm and Heresy", "Reduce 2 less cities.")
      ],
      negativeEffects: [
        CalamityEffect("Civil War", "Select 5 additional unit points.")
      ],
      points: 6,
      discounts: {AdvanceColour.yellow: 20, AdvanceColour.green: 20}),
  Advance(
      colour1: AdvanceColour.blue,
      colour2: AdvanceColour.green,
      price: 250,
      title: "Mathematics",
      points: 6,
      discounts: {
        AdvanceColour.blue: 20,
        AdvanceColour.yellow: 10,
        AdvanceColour.orange: 10,
        AdvanceColour.red: 10,
        AdvanceColour.green: 20
      }),
  Advance(
      colour1: AdvanceColour.blue,
      colour2: AdvanceColour.orange,
      price: 290,
      title: "Wonder Of The World",
      description:
          "During the Trade cards acquisition phase, you may acquire 1 "
          "additional trade card for free from a stack number that is "
          "higher than your number of cities in play. Wonder of the World "
          "counts as a city during the A.S.T.-alteration phase.",
      notes: [
        "Acquiring this additional card is considered purchasing for 0 "
            "treasury tokens during additional purchases.",
        "Players cannot acquire the additional card while having 9 cities "
            "in play."
      ],
      negativeEffects: [
        CalamityEffect(
            "Corruption", "Discard 5 additional points of face value.")
      ],
      points: 6,
      discounts: {AdvanceColour.blue: 20, AdvanceColour.orange: 20}),
};

/// ALL_ADVANCES indexed by advance title.
final Map<String, Advance> indexedAdvances = {
  for (var e in allAdvances) e.title: e
};
