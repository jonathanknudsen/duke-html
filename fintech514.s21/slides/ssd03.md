name: inverse
layout: true
class: center, middle, inverse

course: Secure Software Development
title: 03 Designing Security In
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

- Secure Design Principles

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

# Secure Design Principles

---

# No Shortage of Advice

- [Those party animals Saltzer and Schroeder](http://web.mit.edu/Saltzer/www/publications/protection/Basic.html) (1974)

- [McGraw's _On Bricks and Walls_](https://www.sciencedirect.com/science/article/pii/S016740480200305X) (2002)

- [Shostack's The Security Principles of Saltzer and Schroeder](https://adam.shostack.org/blog/the-security-principles-of-saltzer-and-schroeder/) (2005, with Star Wars references)

- [Todd Merritt: 9 Software Security Design Principles](https://dzone.com/articles/9-software-security-design) (2013)

- [Eric Boesma: Security by Design: 7 Application Security Principles You Need to Know](https://www.cprime.com/resources/blog/security-by-design-7-principles-you-need-to-know/)

- [Synopsys: 4 principles of secure software design](https://www.synopsys.com/blogs/software-security/principles-secure-software-design/) (2016)

---

class: whitey
background-image: url(images/Jack_Sparrow.jpg)

# The Pirate Code of Secure Design Principles

- It's more of a set of guidelines

- Some contradictions

- Mostly about practice and<br/>experience

- Common sense goes<br/>a long way

---

# Defense in Depth

- If the web server is compromised, make it hard to get into the API server

- If the API server is compromised, make it hard to get into the database

- If the database server is compromised, the data should be encrypted

- See also: [zero trust](https://tailscale.com/blog/zero-trust-networks/)
---

# Fail Safe / Fail Secure

- Answer should always be "no" unless you're sure it is "yes"

- E.g. if you can't authenticate something, don't give it access

- E.g. if something seems off in the nuclear power plant, shut it down

- This is both harder and more important in some settings, like healthcare or critical infrastructure

- Apple's [`goto fail`](https://nakedsecurity.sophos.com/2014/02/24/anatomy-of-a-goto-fail-apples-ssl-bug-explained-plus-an-unofficial-patch/)

---

# Secure By Default

- Default behavior should always be secure

- Make developers and users explicitly choose unsafe paths

---

# Minimize Attack Surface

- More about configuration probably

- If your product has an HTTP and and HTTPS interface, you should probably only enable the HTTPS one by default

- Minimize the places where an attacker can cause trouble

---

# Economy of Mechanism / Simplicity

- A.k.a. _Keep it Simple, Stupid_ or _KISS_

- Bugs thrive in complexity

- Very much at odds with using frameworks and open source components

---

# Open Design / No "Security By Obscurity"

- Assume that everyone knows how your stuff works

- An attacker with sufficient resources will be able to figure it out

- There is a whole field for this: _reverse engineering_ (RE)

- Cryptography is also like this

- Security depends on keeping secrets secret

---

# Least Privilege

- Give users/modules/processes/containers/systems the least amount of privilege they need to function

- For example, just becuase a module needs access to a certain directory, don't give access to the entire filesystem

- Don't give processes/containers/whatever root privileges when it's not really necessary

---

# And Some Others I Don't Care About As Much

- Complete Mediation

- Separation of Privilege

- Least Common Mechanism

- Psychological Acceptability

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
 
 - https://eopgame.azurewebsites.net/

---
template: inverse

# Thank You


