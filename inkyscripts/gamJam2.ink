VAR isAccountant = false
VAR isSicario = true
VAR peak1 = 0
VAR peak2 = 0
VAR peak3 = 0
Office Work@"IT'S 1 PM, THE BEST IS YET TO COME. NEXT UP, CARLOS FERNANDEZ WITH HIS HIT SINGLE, 'THE WORLD IS YOURS...'"@Tuesday, 1:19 am@Location: Some Accounting Office in Mexico...@Codename A-Head:
    -> next2
    
=== next2 ===
    All right people, today's the day. A long-time associate, Stephanie, is being fired, and that means when you comes in today, she's gonna die. You all, need to keep your heads on straight.@You: What a pain.@A-Head: You! What're you staring off into space for?.@Me?
            *I'm the sicario, I'm going over what I have to do again, asshole.@ -> sicario
            *I'm sorry sir, I was thinking on my spreadsheets@ -> accountant
        
=== accountant ===
~ isAccountant = true
    You're an accountant for a big fucking cartel. They shoot shit and kill people. You keep your head down, make your damn money, don't ask questions, and go home. It's not a bad life really.@ Sometimes you get annoying coworkers though.@
    
    Carlos: Man can you believe they're gonna sock this idiot here.@Carlos: Oh I think they're gonna shoot her.@Carlos: It's gonna be brutal.@Carlos: I'd never seen one of these, but I know a lot about..."@On
    
   and on he won't stop.@ -> main
    
=== sicario ===
~ isSicario = true
You're the guy who's gotta kill this stupid bastard today. She crossed the cartel or whatever and you're a hitman, it's just another day.@She should have no idea what's coming... then why do you feel so fucking tense?@And who is this dunce talking to me?@

    Carlos: Wow so you're the guy.@ The guy.@ Carlos: You know, I wasn't originally gonna be an accountant here.@ Carlos: I was gonna be a sicario just like you, but when I told ma, she beat me with her slipper and told me I wasn't allowed.@ Carlos: So I'm still working with the cartel to get back at her; yeah I live on the edge...@
    
    This kid could go on for days and it's getting on your nerves...@I did not have time to finish this path, so this is the end. Choose the accountant option. -> END
    
=== main ===
The office door lock clicked. Oh yeah, Stephanie is here.@
{isAccountant:
    -> accountant2
}

===accountant2===
Stay calm. Stay calm. You know better, just chillax. But also, you could take a peek. You've never met a middle-manager before, but she's bound to be bad-ass.
* Take a peak.@ -> peak
* Keep typing on your computer.@ -> keepAtSpreadsheets

=peak
You decided to take a look and there she was:@ red leather biking jacket@brown slacks@prestine brown skin@but you had to get back down quick because you won't be the one to make her suspicious...@still it's a shame she had to die today; maybe you could've gotten along well.@
~peak1 = 1
->accountant3
=keepAtSpreadsheets
You decide to mind your business. No point in taking risks.@You could hear her walk past you towards the head accountant office.@
-> accountant3

===accountant3===
10 minutes pass.@She had walked in and out of the Head Accountant's (A-Head as he's known) office.@ You could take another peak...
* Take a peak.@-> peak
* Keep typing on your computer. -> keepTyping

=peak
You take a peak.@Silvery short hair with designer shades.@She walked along the wall of the office around to the walk-in wall safe.@You retreat back into your cubicle.@
~peak2 = 2
->accountant4
=keepTyping
Not worth doing anything stupid just for your curiosity. Keep at your spreadsheets. Keep at them.@ You hear them approach the walk-in safe where the killing was to occur.@ -> accountant4
===accountant4===
For some reason, just as she was about to walk into the safe at the guidance the sicario here, you could hear them walk to the breakroom.@ You could have sworn that right past that door was the other agent meant to shoot her dead...@So why are they going to the break room?@You wanna peak?
*Take a peak.@ -> peak
*Keep typing.@ -> typer
=peak
~peak3 = 1
Time to take a{peak1 + peak2 > 0:nother | } look.@ -> confrontation

=typer
You'll just keep on typing and typing and typing till she dies.@
VAR peakTotal = 0
~ peakTotal = peak1 + peak2 + peak3
{peakTotal == 3:
    -> confrontation
- else:
    {peakTotal == 2:
        {peak3 == 0:
            -> hostage
            - else:
            -> confrontation
        }
    - else:
        {peakTotal > 0:
            {peak3 == 0:
                -> hostage
                -else:
                -> confrontation
            }
            - else:
            -> shootout
        }
    }
}
===confrontation===
Stood outside your cubical were two people.@ The sicario nervously right in front of a Stephanie with an arm extended forward.@Stephanie: Caught you staring. Something wrong Mr. Accountant?@
*"You have a lovely voice.@"
-> tbc
*"Nothing at all.@"
-> tbc
*No answer.@
-> tbc

===hostage===
The end of something metallic pressed between your shoulder blades.@Stephanie: Hey there buddy. Caughtcha' staring earlier.@Don't move much.@
-> tbc
===shootout===
You waited and waited, but nothing happened. Then you heard it and it deafed you.@ The shot rang out.@Followed by more.@A little wetness got in your eyes. Deafening eruption echoed throughout the office. Cork and fabric flew all above you as fast as ten whizzes did. You heard a wet thud against the desk next to you before a mangled Carlos splotched the floor in a splat in front of you. Then something hot struck you twice and he fell on top of the blabberer.@Shootout Death End 1.
-> END


===tbc===
(to be continued)
-> END
