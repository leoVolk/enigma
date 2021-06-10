EXTERNAL ShowCharacter(characterName, position, mood) 
EXTERNAL HideCharacter(characterName)
EXTERNAL ChangeMood(characterName, mood)


// variables
VAR relationship_strength = 80
VAR mental_health = 50

VAR know_about_food_issue = false

-> start

=== start ===
{ShowCharacter("Player", "Left", "Fine")}
{ShowCharacter("Alice", "Right", "Fine")}
Player: Hey babe?
Alice: Yeah?
Player: Are you feeling okay?
Alice: Yeah... why?
Player: Well, that's what I wanted to ask. You know.. after yesterday?
Alice: Oh... 
Alice: Yeah I'm feeling better, I was just stressed and my stomach hurt.
Player: I needed an angle to approach her. #thought
*** Is something bothering you?
-> is_something_bothering_you
*** I'm worried about your eating
-> ask_about_food
*** You threw up yesterday... didn't you?
-> ask_about_throwing_up

=== is_something_bothering_you ===
Player: Is something bothering you?
Alice: Wha... what do you mean?
{ChangeMood("Alice", "SadHappy")}
Player: I mean... 
Player: You've been kind of distant lately.
{ChangeMood("Player", "Serious")}
Player: It's like something is constantly on your mind.
Alice: ...
Player: I'm not wrong am I?
Alice: No um...
Alice: You're probably right.
Player: What is it?
Player: You know you can tell me.
Alice: No I know I just um...
Alice: I don't know, I've not been really feeling myself recently.
Alice: I don't know what to tell you.
Player: Is it something with work?
Alice: No... it's nothing, it's... 
Alice: I don't think there's any specific reason, you know?
Player: I feel like she's hiding something. #thought
{ChangeMood("Player", "Fine")}
Player: But it seems like she's not comfortable talking about it #thought
Player: Maybe I should just let it go? #thought
Player: Or maybe I need a different angle? #thought
***I'm here for you
-> Here_for_you_ignorant
***I'm worried about your eating
-> ask_about_food
***You threw up yesterday... didn't you?
-> ask_about_throwing_up

=== ask_about_food ===
Alice: Wha... what do you mean?
{ChangeMood("Alice", "SadHappy")}
Player: I mean... 
Player: You've been barely eating recently.
Player: You don't finish your meals.
Player: Is there something on your mind?
{ChangeMood("Player", "Serious")}
Alice: No... it's nothing it's... 
Alice: I've just not been hungry you know?
Player: That's cool but it's not how you normally are.
Player: I'm just worried, you know?
Alice: No I know um... I just...
Alice: I guess it's because of stress or something.
Alice: I've had a lot on my mind.
Player: Stress? Did something happen at work?
Alice: No, nothing happened. It's just... 
Alice: I don't know, I just don't feel very hungry.
Player: There's definitely something going on #thought
{ChangeMood("Player", "Fine")}
Player: She's just not saying it #thought
Player: Should I ask about something more specific? #thought
Player: Or just let it go? #thought
*** Did you eat breakfast? -> ask_about_breakfast 
*** I'm here for you -> Here_for_you_ignorant

=== ask_about_throwing_up ===
Player: I just have to be straightforward, I guess. #thought
Player: You threw up last night, didn't you?
{ChangeMood("Alice", "Surprised")}
Player: What happened?
{ChangeMood("Alice", "Uncomfortable")}
Alice: I just, I...
Alice: I didn't feel good. My stomach felt funny and I thought maybe I should just, you know.
Player: So you threw up to make yourself feel better?
{ChangeMood("Player", "Serious")}
Alice: I guess, yeah.
Player: Well, did it help?
Alice: A bit. I must have eaten something weird.
Player: But you barely ate last night.
Alice: Umm... 
Alice: Yeah because of that.
Alice: Maybe it was something I'd eaten earlier.
Player: Hmm... #thought
Player: I don't think this is her true reason. #thought
Player: But at least she's not denying it, I guess. #thought
*** Next time you feel bad, talk to me. -> throwing_up_support
*** Throwing up is not the answer. -> throwing_up_dismiss

=== throwing_up_support ===
~relationship_strength += 10
~mental_health += 5
~know_about_food_issue = true
Player: I know it was a lot for her to tell me that when she was trying to deny it so hard. #thought
Player: I'm worried it wasn't just a one-off, though. #thought
Player: Babe, I know it's hard for you, but I'm on your side here, you know?
Player: Next time you don't feel good, just talk to me first, okay?
Player: We'll figure it out. 
Alice: I just, I was embarassed...
{ChangeMood("Alice", "Crying")}
Alice: I didn't know what you'd think.
Player: Baby, you don't have to worry about stuff like that with me. 
Player: You know I'd never judge you.
Alice: I know... 
Alice: Thank you.
Player: Come here.
-> END

=== throwing_up_dismiss ===
~relationship_strength -= 5
~mental_health -= 10
Player: I don't really get why you'd force yourself to throw up.
{ChangeMood("Alice", "Uncomfortable")}
Player: There are so many medications for bad stomach, why be so drastic?
{ChangeMood("Alice", "Fine")}
Alice: I know...
{ChangeMood("Alice", "Sad")}
Alice: I didn't really think about it you know.
Player: What!?
{ChangeMood("Player", "Upset")}
Player: You didn't think that it's not normal to force yourself to throw up!?
Alice: Well, no! 
{ChangeMood("Alice", "Upset")}
Alice: Why all the questions, anyway?! 
Alice: I told you I didn't feel good!
Player: ...
Player: Just don't do it anymore, okay? 
Player: It's not like it's going to help with anything.
Alice: Yeah, I'm sorry...
{ChangeMood("Alice", "Sad")}
{HideCharacter("Alice")}
-> END

=== Here_for_you_ignorant ===
~relationship_strength += 5
Player: I'm here for you babe, you know that?
{ChangeMood("Player", "Fine")}
Player: Anytime you want to talk, I'm here.
Player: Come here.
Player: I guess a cuddle and some support is all I can do for now. #thought
Player: She seems overwhelmed with whatever it is that's on her mind. #thought
-> END

=== ask_about_breakfast ===
Player: Did you eat breakfast today?
Alice: Of course!
{ChangeMood("Alice", "Uncomfortable")}
Player: Wow that was quick. #thought
{ChangeMood("Alice", "Serious")}
Alice: I mean... Yeah I did.
{ChangeMood("Alice", "Uncomfortable")}
Alice: I had some cereal in the morning.
Alice: Why?
*** You don't have to hide things from me -> food_talk_gentle
*** Why are you lying? -> food_talk_pressure
*** No reason... -> food_talk_let_go

=== food_talk_gentle === 
Player: I know she's stressed out already, but I need to know the truth. #thought
Player: You don't have to hide things from me, you know that?
Player: I'm on your side.
Alice: I, I know.
{ChangeMood("Alice", "Sad")}
Alice: It's just that...
Player: Hmm?
Alice: I just have been...
{ChangeMood("Alice", "Crying")}
Alice: I keep thinking...
Alice: I keep thinking about putting on weight and I get worried and stressed out.
Player: ...
Alice: I guess that's why I haven't been eating properly... 
Player: Baby... 
Player: Come here.
Player: You know there is nothing to worry about, you're beautiful!
Alice: ...
Alice: Th- Thank you.
{ChangeMood("Alice", "Sad")}
Player: I'm glad you told me.
Player: Now at least I understand what's going through your head.
Player: So thank you, I know it wasn't easy on you.
Alice: I'm sorry...
{ChangeMood("Alice", "Crying")}
Player: You have nothing to be sorry about, don't apologise.
Alice: *Sob* I'm really worried though!
Player: I know baby.
Player: We'll deal with it, okay? Just remember I'm here for you.
Alice: Okay.
~mental_health +=5
~relationship_strength +=10
~know_about_food_issue = true
-> END

=== food_talk_pressure ===
Player: I can't believe she's lying to me about something this simple #thought
Player: I'm starting to be fed up with this evasiveness #thought
Player: Why are you lying to me?
-> too_many_questions

=== food_talk_let_go ===
Player: I can tell she's lying. #thought
Player: It seems like she really doesn't want to talk about it. #thought
Player: I probably shouldn't pressure her further on this. #thought
-> END

=== too_many_questions ===
Alice: What's up with all the questions!?
{ChangeMood("Alice", "Upset")}
Alice: Why are you interrogating me like this? Like I've done something wrong?
Player: Wha- no, I just...
{ChangeMood("Player", "Serious")}
Alice: Just give me a break!
Player: ... #thought
Player: Wow. Well done me. #thought
{ChangeMood("Player", "Upset")}
~relationship_strength -= 10
~mental_health -=10
-> END
