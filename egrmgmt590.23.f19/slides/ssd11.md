name: inverse
layout: true
class: center, middle, inverse

course: Secure Software Development
title: 11 Fuzzing 2
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

- Beyond AFL

- Pirate Code of Fuzzing

- How Fuzzy is Fuzzy Enough?

- Workshop: Attack Surface Analysis

- Fuzz Well

- Demonstration: TLS Fuzzing with Defensics

- The Oracle Problem

---
template: inverse

# Beyond AFL

---

# Coverage-guided Mutation Only Goes So Far

.float[.image-30[![Don Quixote](images/don-quixote.jpg)]]

- Impossible dream

 - Fuzzer knows nothing about your target
 
 - Finds vulnerabilities anyhow
 
- So far, not practical or really necessary

- Coverage-guided mutation is pretty good

- Generational fuzzing produces better test cases but requires more up-front work

- Network protocol fuzzing is (so far) mostly beyond the scope of AFL and kin

---

# honggfuzz

- https://github.com/google/honggfuzz

---

# QSym

- https://github.com/sslab-gatech/qsym

---

# moflow

- https://github.com/moflow/moflow

---

# Pirate Code of Fuzzing

.float[.image-50[![Captain Jack Sparrow](images/jack-sparrow.jpg)]]

- Don't fuzz live ("production") targets

- Don't fuzz anything that does not belong to you

- Don't fuzz things that will be live

 - Think pacemaker

- Logical and physical proximity

- Work in a contained environment

 - Especially with broadcast packets

--

&nbsp;

&nbsp;

- And when you find vulnerabilities

 - Give the developer a chance to fix them before tweeting
 
 - Follow responsible disclosure practices

---
template: inverse

# [How Fuzzy is Fuzzy Enough](https://prodduke-my.sharepoint.com/:p:/g/personal/jk471_duke_edu/Ec5aQLP6abpDg3JAR3MiB4YB0rmWBkZsE8BV1RLPzb7lGw?e=u8Kst3)

Slides 7 - 19

---
template: inverse

# Attack Surface Analysis

netstat and nmap

---
template: inverse

# [Fuzz Well](https://prodduke-my.sharepoint.com/:p:/g/personal/jk471_duke_edu/EfyN-EWBfAlPoD_4isSZBPYBTM9lhlKWMFUBmbekm7gEtA?e=nKjfWC)

Slides 10 - 26

---

template: inverse

# TLS Fuzzing with Defensics

---

# Defensics

- King of generational fuzzers

- Every test suite is a network protocol or file fuzzer

- Different suites for client or server roles

- Over 250 test suites

---

# Safeguard

- Idea: check functional stuff while fuzzing

- For example:

 - Authentication: if I supply bad credentials, but get access anyhow
 
 - Amplification: if input/output ratio differs wildly from baseline

---

# Demonstration

- openssl 0.9.5 for carnage

- openssl 1.0.1f for Safeguard

---
template: inverse

# [The Oracle Problem](https://prodduke-my.sharepoint.com/:p:/g/personal/jk471_duke_edu/ESDYQzsAb9VMsHq4TJj95OEBDsJ_GXH-ReOQoJHTGBEK0A?e=Aud3IT)

---

.center[.image-50[![Keep calm](images/keep-calm.png)]]

