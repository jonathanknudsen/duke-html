name: inverse
layout: true
class: center, middle, inverse

course: Secure Software Development
title: 01 Software Security
course: Secure Software Development
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

- Overview

- Impact

- Adversaries

- Vulnerabilities and Exploits

- Strategies

- Bureaucracy

---

template: inverse

# Overview

---

# The Holy Trinity

- Software security is about protecting...

 - .red[C]onfidentiality

 - .red[I]ntegrity

 - .red[A]vailability

- ...of systems and information

--

## Other Important Concepts

- Authentication

- Authorization

- Nonrepudiation

---

# Confidentiality

- Secret things stay secret

- Your bank account is not visible to anyone besides you and maybe the bank

- Your medical records are not visible to anyone besides you and your doctor

---

# Integrity

- Information you view has not been changed

---

# Availability

- Software systems and information are available when you need them

- Attacks against availability are Denial of Service (DoS) attacks
---

# Authentication

- Proving identity

- At the airport, you show a government ID

- In computers, typically a user name and a password
 
- It goes both ways: a web site should prove its identity to you

---

# Three Ways to Authenticate

.float[.image-50[![Eyeball](images/minority-report_cruise-eyes.jpg)]]

1. __Something you know__

 - Password, code word, combination

1. __Something you have__

 - Hardware token, physical key, ID card

1. __Something you are__

 - Biometrics: fingerprint, retina scan, DNA

---

# Multifactor Authentication (MFA)

- Sometimes two-factor authentication (2FA)

- Prove identity with more than one thing

- Common current implementation:

 - Something you know: password
 
 - Something you have: mobile phone

---

# Authorization

- Correctly calculating what users are allowed to do

- Access to accounts

- Ability to make changes

---

# Nonrepudiation

- Ability of a system to ensure that users can't deny previous actions

- No takebacks

---

# Security is Like Cleaning

- "Is it secure?" is not a meaningful question

 - No: "Is the kitchen counter clean?"
 
 - Better: "How did you clean the kitchen counter?"
 
 - No: "Is this car safe?"
 
 - Better: "If I add a collision detection system, will fewer people die?"

- __You never get to 100%__

- Your software can be _more_ secure or _less_ secure

- There are no absolutes

 - Sorry

- This is really risk management

---

# Security is Hard to Measure

- Given a piece of software, it would be nice to have a security "grade"

- Meaningful metrics are elusive

- Number of bugs found post-release

 - Assumes constant level of use
 
 - Assumes constant leve of scrutiny

- Number of bugs found pre-release

---

# Achieving Balance

- Value of assets versus cost of compromise

- $20 on the table

 - Low cost
 
 - Low reward

- $1,000 on the table

 - Low cost
 
 - High reward

- $20 in a sealed concrete box

 - High cost
 
 - Low reward

---

template: inverse

# Impact

---

# What's the Big Deal?

- Software is _everywhere_

 - [Marc Andreesen (2011): "Software is eating the world."](https://a16z.com/2011/08/20/why-software-is-eating-the-world/)

 - [Watts Humphrey (2001?): "Every business is a software business."](https://www.pearsonhighered.com/assets/samplechapter/0/2/0/1/0201776391.pdf)
 
- Rewards are high

- Attacker costs are low

- Most software is not made well

- Most software is not configured well

---

# We Are Numb

- Breaches make frequent headlines

- Costs are astronomical

- It's all routine now

--

- _We should be hopping mad!_

--

- Let's make this better

---

template: inverse

# Adversaries

---

# Who Are Those Guys?

.float[.image-50[![Who Are Those Guys?](images/bc-and-sk.jpg)]]

- Punk-ass kids

- Disgruntled employees

- Industrial spies

- Organized crime

- Countries

---

# APTs

- Advanced Persistent Threat, an almost meaningless phrase

 - Has come to mean "advanced threat group"

- Usually means state-sponsored

- Also includes sophsticated criminal groups

- A fascinating overview by The Grugq:

 - https://youtu.be/wP2J9aYM6Oo

---

# APT Celebrities

- APT1 / Comment Crew / Comment Group _(China's PLA Unit 61398)_

 - [Grandpappy of APT reports from Mandiant](http://intelreport.mandiant.com/Mandiant_APT1_Report.pdf)
 
 - Large-scale theft of intellectual property
 
- APT28 / Fancy Bear / Sofacy _(Russia's GRU)_

 - 2015 TV5 Monde attack
 
 - 2016 Democratic National Committee breach
 
- Lazarus Group _(North Korea)_

 - WannaCry, Sony Pictures breach
 
- Equation Group _(United States NSA)_

 - Stuxnet, Flame
 
 - Outed by Shadow Brokers in 2016

---

# Attribution is Hard

- A decentralized Internet makes pinpointing attackers difficult

- Attacks are often launched from compromised computers

- Detailed analysis takes time and money

- Fuzzy attribution based on

 - Targets and timing, geopolitical context, i.e. the _why_ of the attack
 
 - Tactics, techniques, and procedures (TTPs), i.e. the _how_ of the attack

---

# Malware

- Software that does bad stuff

 - Uses your computer in ways you didn't intend
 
 - Worms
 
 - Trojans
 
 - Viruses
 
 - Ransomware
 
 - RATs (Remote Access Toolkits)
 
 - Yada yada yada

- Software that works by exploiting vulnerabilities

- Enough said: we will concern ourselves with reducing vulnerabilities

---

template: inverse

# Vulnerabilities and Exploits

---

# Three Flavors of Vulnerabilities

- In software, a _vulnerability_ is a weakness that could be exploited by an attacker to damage C, I, or A

- __Design__ vulnerabilities

 - Bank web site with no authentication

- __Configuration__ vulnerabilities

 - Bank web site where all users get the same default password

- __Code__ vulnerabilities

 - Mistake in the web site code so an attacker can supply input that causes a failure

- I use "vulnerability" and "bug" interchangeably, but some people are more pedantic about it (another common term: _weakness_)

---

# Known Vulnerabilities

- Vulnerabilities that have been found and published

- In the US, NIST keeps a list of known vulnerabilities

 - National Vulnerability Database (NVD)
 
 - https://nvd.nist.gov/

- Each vulnerability is known as a CVE

 - It stands for Common Vulnerabilities and Exposures

- In general...update your software!

 - But it's painful
 
 - And people frequently don't (cough, Equifax)

---

# Unknown Vulnerabilities

- You've already made a mistake, but no one has found it yet

- Also called _zero days_ or _0days_

- Attackers love these

- Traditional (reactive) defenses are useless here

---

# Wetware

- People are frequently the weakest link, i.e. the easiest attack vector

- Just trying to get things done

 - Will usually click on anything no matter what it says
 
 - Usually security messages are confusing anyhow

- _Social engineering_ is exploiting humans to compromise systems

 - Should be factored in threat models and designs
 
 - Usually: trick a user into running some malware or giving up a password
 
- Phishing

---

# Bugs are Bugs are Bugs

.float[.image-50[![Hydra](images/hydra.png)]]

- Some people like to classify vulnerabilities

 - Quality
 
 - Security
 
 - Safety

- Sometimes also
 
 - Reliability
 
 - Robustness

- But they're just different heads on the same beast

---

# How an Attacker Uses a Vulnerability

- Any way she can!

- Simplest exploit is usually a denial of service

 - Crash a process
 
 - Consume resources until something fails

- Some exploits can result in failures of damaged confidentiality

 - For example, a direct object reference vulnerability in a bank

- Some vulnerabilities allow attackers to run their own code on the victim's computer

 - These are Remote Code Execution (RCE) vulnerabilities
 
 - These are very powerful

---

# Attack Surface

- For a piece of software, or a system

- As with threat modeling, part of the trick is correctly determining scope

- Every place the system takes input is an _attack vector_

- All attack vectors together are the _attack surface_

---
template: inverse

# Strategies

---

# Security Features versus Software Security

- Unfortunately, these are often confused (see Howard and Lipner, Chapter 5)

- A security feature is additional functionality intended to improve security

 - Storing passwords hashed instead of in plaintext
 
 - Rate limiting login attempts
 
 - Improve the _what_ of the product

- Software security is the focus of this class

 - Using a process and technologies to make software more secure
 
 - Finding and fixing more bugs earlier
 
 - Improve the _how_ of the product

---

# Reactive Security

.float[.image-30[![T-Swizzle](images/t-swizzle-cropped.jpg)]]

## Band-Aids Don't Fix Bullet Holes

- Basically most of the security industry

 - Bajillions of dollars every year

- Antivirus, for example

- Firewalls

- IDS / IPS

- Malware or attack "signatures"

.footnote[Thanks T-Swizzle]

---

# Proactive Security

## Break Your Own Stuff First

- More testing and better testing

- Before you release software, find more bugs and fix them

- Slightly flawed analogy: crash testing for cars

- Variety of approaches

 - Design review

 - Code review
 
 - Pair programming
 
 - Penetration testing (pentesting)
 
 - Automation!

---

# Perimeter Security

.center[.image-40[![Castle](images/castle-wall.jpg)]]

- Comforting and persistent analogy, but hokum nevertheless

- Some things are obviously wrong, but otherwise...

 - What about new kinds of attacks?
 
 - What about attacks that are clever enough to change?

- Firewalls, IDS / IPS work this way

---
class: whitey
background-image: url(images/nospoon-16x9.png)
background-size: 100%

# ...and Anyhow, What Does Perimeter Mean?

---

# Endpoint Security

- Basically a RAT or spyware

- Runs on your computer

 - Can keep things up to date
 
 - Can set policies about installing software, screen locking, etc.
 
 - Can see everything on your computer
 
 - Can control your computer

---

# Operational Security

- Are you leaking information?

- Can your adversary see what you're doing?

- Are your developers asking questions and posting code publicly?

- Do your job postings reveal strategic directions?

---

# Security By Checklist

- No

- Adopt a framework or standard

- Goal is to check items off, not to improve security or processes

- Maybe run tools

 - But don't anything with the results

 - But don't really optimize them

---

# Security By Denial

- No

- "No one would want to attack our product."

- "That's not our code."

- "I'm sure our vendor delivered us a reasonably secure product."

- "I'm sure those open source developers delivered a reasonably secure product."

- "We haven't had a security incident yet. That product is solid."

---

# Security By Obscurity

- No

- "No one will ever figure out what we did."

- "Our system design is proprietary. No one knows it outside our organization."

- "Our source code is inside the network perimeter."

- "No one can pull the firmware off our hardware."

---

# Defense In Depth ⭐️

- Layers of defense

- Delay or deter attackers

- So what if you steal my password file? It's salted and hashed!

- So what if you steal my database? It's encrypted!

- Part of a larger collection of secure design principles

 - https://www.owasp.org/index.php/Security_by_Design_Principles

---

template: inverse

# Bureaucracy

---

# (1 of 3) Product Security

- Some people confuse two _completely separate_ topics and call them "product security"

- Adding security features to products

 - For example, adding an account lockout feature to a network router

- Improving the security of the product itself

 - Proactively testing network protocol implementations for vulnerabilities

---

# (2 of 3) IT (Information Technology) Security

.float[.image-30[![I pity the fool](images/pity-the-fool.jpeg)]]

- Imagine the tremendous scope

 - All employee laptops
 
 - All network infrastructure, VPNs, MFA, firewalls, IDS/IPS
 
 - All public-facing infrastructure
 
 - Every application running everywhere in the organization
 
 - Updates, keeping up with security news, etc.

- Again, pressure is always for functionality

 - I can't print!
 
 - I can't connect to the Wifi!
 
 - I need to install this application!

---

# (3 of 3) Incident Response

.float[.image-40[![Fire truck](images/RE23night1.jpg)]]

- Things will go wrong

 - You _must_ have a plan when they do

- Sometimes divided

 - Product Security Incident Response Team (PSIRT)
 
 - Computer Security Incident Response Team (CSIRT)

- Think fire drills

 - The point is to know what to do in an emergency

---

# How Things Usually Evolve

- Slowly and painfully

- At first, maybe nobody is responsible for security

- Then something bad happens

 - An attack or breach happens
 
 - Maybe an important customer finds vulnerabilities or starts asking questions

- Now everybody runs around like headless chickens

 - Maybe incident response gets to be a real thing
 
 - Maybe a security team gets created
 
 - Maybe some security training happens

- What should really happen

 - An overall methodical approach to security in the organization

---
class: whitey
background-image: url(images/unicorn.png)

# In a World With Unicorns

- The organization recognizes the need for security<br/> and supports it at the highest level

- CISO or CIO has product security, IT security,<br/> and incident response

- Has authority to create and maintain<br/> policies and procedures that apply across<br/> the whole organization
