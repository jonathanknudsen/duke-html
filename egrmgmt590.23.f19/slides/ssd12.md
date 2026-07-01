name: inverse
layout: true
class: center, middle, inverse

course: Secure Software Development
title: 12 Web Applications and IAST
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

- Web Applications Are Special

- Common Vulnerabilities

- Manual Analysis

- Demonstration: BurpSuite

- Binary Instrumentation

- Interactive Application Security Testing

- Demonstration: IAST

---
template: inverse

# Web Applications Are Special

---

# Everything is Simpler in C

- Write source code

- Compile source to executable

- Run executable

---

# Java Introduces Another Layer

- Write source code

- Compile source to bytecode
 
- Run bytecode on Java Virtual Machine (JVM)

---

# Web Introduces Two More Layers

- Write source code

- Compile source to bytecode

- Run bytecode inside a _container_, which handles mapping incoming HTTP requests to your application

 - _Servlets_
 
 - _Java Server Pages (JSP)_
 
 - _Java Enterprise Edition (JEE or J2EE)_ is a superset

- Container, and your web app, run on the Java Virtual Machine (JVM)

 - Common containers: Tomcat, WildFly, Jetty, Glassfish, Weblogic

&nbsp;

--

- And it's a web app, so Javascript code runs on the user's browser

- Everything coming from the user side cannot be trusted

---

# Trust

- Server application can't trust input coming from the browser client

- Browser can't trust code coming from just anywhere

---

# Browsers Are Incredibly Dangerous

- Think about it

- It has access to all your user names and passwords

- It has access to your computer's disk, memory, and processor

- It regularly runs code _on your computer_ that comes from _all over the Internet_

---

# Of Course Microsoft Has One Too

- It's a parallel ecosystem for web development

- C# instead of Java language

- CLR instead of Java Virtual Machine

- .NET and now .NET Core (not the same thing!)

- Browser side is much the same

---

# Help for Those Who Ask For It

.float[.image-30[![Albus Dumbledore](images/dumbledore.jpg)]]

- Open Web Application Security Project (OWASP)

- https://www.owasp.org/index.php/Main_Page

- Not everybody asks for help

- Most people are just _trying to get something to work_

---
template: inverse

# Common Vulnerabilities

---

# Cross-Site Scripting (XSS)

- Attacker-supplied Javascript runs on victim's browser

- How does this happen?

 - Some input in a web page form gets sent back to the user
 
 - Input could contain HTML or Javscript

- Reflected XSS

- Persistent XSS

- DOM-based XSS

- OWASP has a page, but it is a little hard to understand

- Your reading this week has a better resource

---

# Injection Attacks

- XSS is the most famous probably


- SQL injection is a famous one

- But also shell injection

---

# Cross-Site Request Forgery (CSRF)

- HTML forms get posted to a URL

- If you are logged in to your bank in one tab...

- ...and you go visit a malicious site in another...

- ...the malicious site can submit forms to your bank

- See https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)

- Solution: add a _token_ as a hidden field to every form

---

# Directory Traversal

- Some web servers expose a directory tree

- Sometimes delivering relative paths in request allows attackers to see things they shouldn't see

---
template: inverse

# Manual Analysis

---

# Intercepting Proxy

- A piece of software that sits between your browser and your target application

- BurpSuite is pretty much industry standard, but also:

 - ZAP (Zed Attack Proxy) (from OWASP)
 
 - And more: https://www.owasp.org/images/d/d8/Intercept-proxies.pdf

- Have to install a root certificate in your browser

- Proxy actually inserts itself as Man in The Middle (MiTM) for HTTPS connections

---
template: inverse

# Demonstration: BurpSuite

---
template: inverse

# Binary Instrumentation

---

# It's Easier with a Virtual Machine Layer

- Java provides a mechanism for this called an _agent_

- You can tell the JVM to start up with an agent

- Agent gets to see everything that goes on

- Servlet standard makes it easy to see HTTP requests and responses

---

# Dynamic Binary Instrumentation (DBI)

- It's possible with "native" executables too, but more complicated

- Interesting and emerging area

- http://deniable.org/reversing/binary-instrumentation

- Not standardized enough for agent-style plugin behavior

---
template: inverse

# Interactive Application Security Testing

---

# See Everything

- Run an agent where the server runs

- See all incoming requests and outgoing responses

- Flag anything that doesn't look right

- Can replay requests to verify vulnerabilities

- Passive: wait for traffic

---
template: inverse

# Demonstration: IAST

nc

tail -f

