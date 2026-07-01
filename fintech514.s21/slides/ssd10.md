name: inverse
layout: true
class: center, middle, inverse

course: Secure Software Development
title: 10 Fuzzing 1
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

- About Fuzzing

- Fuzzing Techniques

- Workshop: radamsa

- Failure

- Workshop: Working with openjpeg

- Workshop: American Fuzzy Lop

- libFuzzer

- OSS-Fuzz

---
template: inverse

# About Fuzzing

---
template: inverse

# [Get Cozy with Fuzzing](https://prodduke-my.sharepoint.com/:p:/g/personal/jk471_duke_edu/EdADzmckCAJPjqCwtm4rDz8Bojw9YoIAMb6_hZNCFP115w?e=0c2N6M)

Slides 10 - 19

---

# The Poet, The Courier, and the Oracle

- The _poet_ creates malformed inputs, or test cases

- The _courier_ delivers test cases to the target

- The _oracle_ detects if failure has occurred and assigns a verdict to each test case

 - In my world, called _instrumentation_

---

# Black, White, and Everything Between

- _Black box_ testing means the test tool knows nothing about the target

 - All interaction happens through "public" interfaces
 
 - The oracle uses only "public" interfaces to detect failures

- _White box_ testing implies total knowledge of the target

 - Allows for fine-grained detection of failure, e.g. resource consumption
 
 - Source code is available, debugging tools, etc.

- _Gray box_ testing implies partical knowledge of the target

---
template: inverse

# Fuzzing Techniques

---
class: whitey
background-image: url(images/space-infinity.jpeg)

# Fuzzing is an Infinite Space Problem

- For any attack vector, you can construct an infinite number of test cases

- Many inputs are easily ignored

- The _quality_ of test cases affects the efficiency of fuzzing

---

# Random

.float[.image-50[![Monkey at typewriter](images/monkey.png)]]

- Pump random bits at the target

- No structure knowledge

- "Dumb"

- Rarely effective

- Test cases don't look like real inputs

.footnote[https://en.wikipedia.org/wiki/Infinite_monkey_theorem]

---

# Template

.float[.image-40[![Tape recorder](images/tape-recorder-xl.jpg)]]

- Capture and playback

- Introduce anomalies during playback

- Good: closely resembles template

- Bad: closely resembles template

 - Blind playback: session IDs, checksums, etc. will be wrong
 
 - No coverage on anything that's not in the template

- Can patch over some of these issues

- _Corpus_ and _corpus distillation_

---

# Generational

.float[.image-50[![Dragon](images/dragon.png)]]

- Test suite knows everything about the data model

 - Can implement from specifications
 
 - Iterate through the model, field by field, to create test cases
 
 - Also test cases with anomalies in multiple places
 
 - Also test cases with messed up message sequences

- Test cases look _mostly_ like real messages

 - Checksums, lengths, session IDs are correct
 
 - Test suite can exchange several valid messages before...bang!
 
 - Non-representative traffic

---
template: inverse

# Workshop: radamsa

## Poet Seeks Courier and Oracle

---
template: inverse

# Failure

---

# Bugs and Failure Modes

- _Arbitrary_, _unpredictable_ relationship between:

.three-one[
## Code-level mechanism

- Ineffective or missing input validation

- Buffer overflows

- Memory leaks and double frees

- Stack corruption

- Race conditions

- Underflows

- Heap overflows
]

--

.three-two[
## Failure modes

- Crash

- Information leak

- Infinite loop

- Resource depletion

- Corrupted data
]

--

.three-three[
## Consequences

- Lost money
 
- Death
 
- Destruction
]

---
template: inverse

# Workshop: Working with openjpeg

## Build systems

## Time travel

## Binaries and Linking

---
template: inverse

# Workshop: American Fuzzy Lop

---

# It's a Rabbit

.float[.image-50[![American Fuzzy Lop](images/American-Fuzzy-Lop.jpg)]]

- But we'll just call it AFL

- http://lcamtuf.coredump.cx/afl/

- Coverage-guided template fuzzer

- Instruments the build to observe control paths

- Uses fork() to optimize speed

---
template: inverse

# libFuzzer

---

# It's Not All About gcc

- https://llvm.org/docs/LibFuzzer.html

- Also a coverage-guided template fuzzer

- libFuzzer is now part of clang, which is part of LLVM, which is its own universe

 - https://en.wikipedia.org/wiki/LLVM

- You define an entry point function that does something with the incoming test case

- libFuzzer takes care of the rest

---
template: inverse

# OSS-Fuzz

---

# Fuzzing for Open Source Projects

- https://github.com/google/oss-fuzz

- Uses AFL and libFuzzer

- Built on ClusterFuzz: https://github.com/google/clusterfuzz

- It's Google, so the strategy is:

 - Use coverage guidance to improve test case quality
 
 - Optimize and parallelize to get more fuzzing done
