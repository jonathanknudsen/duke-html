name: inverse
layout: true
class: center, middle, inverse

course: Secure Software Development
title: 13 Threat Modeling
author: Jonathan Knudsen
email: jonathan.knudsen@duke.edu

---

# {{title}}

{{course}}

{{author}}

{{email}}

.copyright[
![cc](images/cc-88x31.png)

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/).
]

---
layout: false

# Outline

- Threat Modeling Overview

- Draw a Picture

- Course Evaluations

- Upcoming Schedule

- Shall We Play a Game?

---

# Public Service Announcement: You Coulda Saved a Bundle

.center[.image-60[![Groupon cybersecurity](images/groupon.png)]]]

---
template: inverse

# Threat Modeling Overview

---

# Thinking Sad Thoughts

- A _design-time_ exercise to help figure out which _security features_ you need

- Try to imagine everything that can go wrong

- Methodologies with funny names

 - STRIDE
 
 - DREAD
 
 - PASTA
 
 - LINDDUN

---

# Threat Modeling is Loosey-Goosey

- Not well defined

- Everybody does it their own way

- You are never done

- Different people will get different answers

- The only way to get better is practice

---

# Endpoint: _Traceability Matrix_

- Sounds fancy!

--

.center[.image-50[![Neo dodges bullets](images/neo-bullets.jpg)]]]

---

# Let's Call What It Is

- It's a _list_

- Shows threats and mitigations

- Here are some possibilities for the columns of the list:

| Threat (Who) | Attack Vector (Where) | Conceptual Goals (What) | Exploit (How) | Consequence (Impact) | Control (Mitigation) |
| ------ | ------------- | ---------------- | ------- | ----------- | ---------- |
| &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; |

---
template: inverse

# Draw a Picture

---

# System Components

- Include major components of your system

- Granularity is subject to debate

---

# Data Flows

- Show how data moves around

- Include protocols, formats

---

# Trust Boundaries

- Include _trust boundaries_

- This is hard to define, but basically areas of control

 - User controls mobile phone
 
 - Administrator controls web server
 
 - Administrator controls database

 - Nobody controls the Internet
 
---

# Assets

- Not everybody does this, but Cigital / Synopsys does

- Helpful in identifying _things of value_ that might attract attackers

---

# Threats

- Start with the usual suspects

 1. External Internet-based attacker
 
 1. External client-LAN-based attacker
 
 1. External malicious user
 
 1. Internal malicious administrator

- Include new ones if you want

 - But each one gives you more work
 
 - See if you can consolidate classes of attackers

---

# STRIDE

- [Adam Shostack](https://adam.shostack.org/) is a guru, worked at Microsoft

- Author of _[Threat Modeling: Designing for Security](https://threatmodelingbook.com/)_, which is quoted here:

> - __Spoofing__ is pretending to be something or someone you're not.

> - __Tampering__ is modifying something you're not supposed to modify. It can include packets on the wire (or wireless), bits on disk, or the bits in memory.

> - __Repudiation__ means claiming you didn't do something (regardless of whether you did or not).

> - __Information Disclosure__ is about exposing information to people who are not authorized to see it.

> - __Denial of Service__ are attacks designed to prevent a system from providing service, including by crashing it, making it unusably slow, or filling all its storage.

> - __Elevation of Privilege__ is when a program or user is technically able to do things that they're not supposed to do.
 
---
template: inverse

# Course Evaluations

---
template: inverse

# Upcoming Schedule

Last assignment

No more office hours

Piazza or email with questions

Final is 5 December at 6:15 pm in Hudson Hall 232 (as usual)

Happy Thanksgiving!

---
class: whitey
background-image: url(images/wargames.jpg)

.pull-right[

# Shall We Play a Game?

]

---

# It's Called _Elevation of Privilege_ (EoP)

- I am not making this up

- Credit goes to Adam Shostack

- Get it from Microsoft here: https://www.microsoft.com/en-us/download/details.aspx?id=20303

- "Source" is here: https://github.com/adamshostack/eop

- Online versions:

 - http://eopgame.herokuapp.com/
 
 - https://eopgame.azurewebsites.net/ (broken?)

---
template: inverse

# Thank You


