module Utils exposing (timeIn)

import Time exposing (Time)


timeIn : Time -> Time -> String
timeIn time now =
    -- Hint: Time is a Float
    let
        seconds =
            (time - now) / 1000

        minutes =
            seconds / 60

        hours =
            minutes / 60

        days =
            hours / 24

        months =
            days / (365.25 / 12)

        years =
            days / 365.25
    in
        if seconds < 10 then
            "in a few seconds"
        else if seconds < 55 then
            plural "second" seconds
        else if seconds |> within 55 65 then
            "in about a minute"
        else if minutes < 55 then
            plural "minute" minutes
        else if minutes |> within 55 65 then
            "in about an hour"
        else if hours < 22 then
            plural "hour" hours
        else if hours |> within 22 26 then
            "in about a day"
        else if days |> within 6 8 then
            "in about a week"
        else if days |> within 14 16 then
            "in about 2 weeks"
        else if days |> within 20 22 then
            "in about 3 weeks"
        else if days < 27 then
            plural "day" days
        else if days |> within 27 33 then
            "in about a month"
        else if months < 11 then
            plural "month" months
        else if months |> within 11 13 then
            "in about a year"
        else
            plural "year" years


within : Float -> Float -> Float -> Bool
within low high value =
    value >= low && value <= high


plural : String -> Float -> String
plural unit amount =
    let
        roundAmount =
            round amount

        unitPlural =
            if roundAmount > 1 then
                unit ++ "s"
            else
                unit
    in
        "in " ++ (toString roundAmount) ++ " " ++ unitPlural
