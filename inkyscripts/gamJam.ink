Office Work
VAR isAccountant = false
VAR isSicario = true
=== next ===
"IT'S 1 PM, THE BEST IS YET TO COME. NEXT UP, CARLOS FERNANDEZ WITH HIS HIT SINGLE, 'THE WORLD IS YOURS...'"
    -> next2
    
=== next2 ===
    A-Head: All right people, today's the day. A long-time associate, Stephanie, it being fired, and that means when you comes in today, she's gonna die. You all, need to keep your heads on straight.
        _what a pain_
    A-Head: You! What're yo ustaring off into space for?
        _me?_
            *I'm the sicario, I'm going over what I have to do again, asshole. -> sicario
            *I'm sorry sir, I was thinking on my spreadsheets -> accountant
        
=== accountant ===
~ isAccountant = true
You're an accountant for a big fucking cartel. They shoot shit and kill people. You keep your head down, make your damn money, don't ask questions, and go home. It's not a bad life really.
    Sometimes you get annoying coworkers though
    
    Carlos: Man can you believe they're gonna sock this idiot here. Oh I think they're gonna shoot her. It's gonna be brutal. I'd never seen one of these, but I know a lot about..."
    
    On and on he won't stop. -> main
    
=== sicario ===
~ isAccountant = true
You're the guy who's gotta kill this stupid bastard today. She crossed the cartel or whatever and you're a hitman, it's just another day. She should have no idea what's coming... then why do you feel so fucking tense? And who is this dunce talking to me?

    Carlos: Wow so you're the guy. _The_ guy. You know, I wasn't originally gonna be an accountant here. I was gonna be a sicario just like you, but when I told ma, she beat me with her slipper and told me I wasn't allowed. So I'm still working with the cartel to get back at her...
    
    This kid could go on for days and it's getting on your nerves... -> main
    
=== main ===
The office door lock clicked. Oh yeah, Stephanie is here.
-> END