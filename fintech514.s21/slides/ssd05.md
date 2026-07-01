name: inverse
layout: true
class: center, middle, inverse

course: Secure Software Development
title: 05 Cryptography 2
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

- Certificates

- TLS

---

template: inverse

# Certificates

---

# Keys Get Out of Control Fast

- Think about key distribution with asymmetric ciphers

- You would need a public key for everyone you know

- How would you know you had the right key?

- Can you trust anyone you don't know?

- Let's say Robin and Marian have exchanged public keys

 - What if Marian wants to talk with Will, who is Robin's friend?
 
 - Robin could tell Marian about Will's public key using a _certificate_

---

# Certificates

- A certificate is a signed public key that ties the key to an entity

 - It's a credential, a little bit like a passport or driver's license

- Essentially says "_this_ entity has _this_ key"

- Contains information about the _subject_, including the subject's public key

- Contains information about the _issuer_

- Contains the issuer's signature of the certificate

---

# [X.509](https://en.wikipedia.org/wiki/X.509)

- Standard certificate, widely used, currently X.509v3

- The certificate itself

 - Version number, serial number
 
 - Validity period
 
 - Issuer name
 
 - Subject name
 
 - Subject's public key
 
 - Extensions (optional)

- The signature

 - Algorithm
 
 - Signature

---

template: inverse

# Certificate First Look

Grab a certificate from a web page

Check it out in the system viewer

---

# PKIX is Kind of a Big Deal

- Standards

 - X.509 is defined by International Telecommunication Union (ITU)

 - [RFC 5280](https://tools.ietf.org/html/rfc5280) describes practicalities of using X.509 certificates

- Broadly speaking, RFC 5280 defines PKIX, meaning _Public Key Infrastructure (X.509)_

 - Hierarchy of trust
 
 - Certificate Authorities (CAs) issue certificates
 
 - Enables buying stuff online, which was worth [about 2.86 trillion USD in 2018](https://www.digitalcommerce360.com/article/global-ecommerce-sales/)

---

# Certificate Encoding

- Surprisingly complicated

- X.509 is built on [ASN.1](https://en.wikipedia.org/wiki/Abstract_Syntax_Notation_One) (Abstract Syntax Notation One), a standardized way of describing data structures

 - Hierarchical structures
 
 - Object Identifiers (OIDs)

- ASN.1 constructs can be _encoded_ in a variety of ways, most commonly DER (Distinguished Encoding Rules)
 
- PEM (Privacy-Enhanced Mail) encoding is a DER-encoded certificate converted to base64, plus a top and bottom line

- Certificate _chains_ can be encoded similarly, starting at the bottom and working backwards to a CA
---

# Swerve: RFCs

- An RFC (Request For Comments) is an Internet standard

- They aren't really requesting comments

- Usually documenting some _de facto_ standard that is already in use

- Core stuff like IP, TCP, HTTP, etc. is all defined in RFCs

- Publicly and freely available, which is not true about all standards
---

# Swerve: base64

- [RFC 1521](https://tools.ietf.org/html/rfc1521) section 5.2

- Another numbering system

 - Decimal is base 10
 
 - Hexadecimal is base 16 (four bits per digit)

- Base64 defines 64 "digits"

- Each digit is six bits

- Encoding happens 24 bits at a time

- Pad at the end using '=' character

---

template: inverse

# Certificate Second Look

Certificate encoding options from browser

PEM certificate as text

https://lapo.it/asn1js/

---

# Swerve: Distinguished Names (DNs)

- Defined in X.500, but neatly explained in [RFC 1779](https://tools.ietf.org/html/rfc1779)

- A DN is a structured identifier for a person, a server, etc.

- Consists of different parts

 - Common Name (CN): domain name
 
 - Organization (O): Company
 
 - Organizational Unit (OU): Company division
 
 - State (S)
 
 - Country (C)
 
 - etc.
 
---

# Wait a Minute!

.float[.image-50[![God](images/god-sistine.jpg)]]

- CAs sign certificates linking public keys to entities

- Who signs a CA certificate?

--

- The CA! It's a _self-signed_ certificate!

--

- Anyone can create a self-signed certificate, with any information for issuer and subject

---

# How Is This Possible?

- Browsers, operating systems, other devices have a list of self-signed CAs that they trust

- It's a suprisingly long list

---

template: inverse

# Certificate Third Look

Find the CA list in the settings

---

# Getting a Certificate

- Standard for obtaining a certificate from a certificate authority

- Certificate Signing Request (CSR)

- Currently [RFC 5967](https://tools.ietf.org/html/rfc5967)

 - Builds on [RFC 2986](https://tools.ietf.org/html/rfc2986), which is also known as PKCS#10

- CSR contains just what you would expect

 - Information about the submitter, which will become the subject of the certificate
 
 - The submitter's public key
 
 - A signature of the CSR, creating using the submitter's private key

- In Linux, you can use `openssl req` to create a new key and a CSR in one swoop:

```
openssl req -new -newkey rsa:2048 -nodes -keyout server.key -out server.csr
```

---

# Certificates Gone Bad

- What if somebody's private key is stolen?

- What if a bad person got a legitimate certificate?

- Some certificates must be _revoked_

- Several unsatisfactory solutions exist

- Certificate Revocation List (CRL) is part of [RFC 5280](https://tools.ietf.org/html/rfc5280)

 - Idea was that clients would request these lists from CAs, but there are too many CAs, you can't rely on their infrastructure, etc.

- Open Certificate Status Protocol (OCSP) allows you to ask about a specific certificate...but it slows down your initial connection, and what if the OCSP server is down?

- Google Chrome has a proprietary solution CRLset, and Firefox has OneCRL, which embeds revoked certificates in the browser, but not everything, just revoked intermediate CAs

- OCSP stapling: servers provide a valide OCSP response as part of the TLS handshake

- See [SSL certificate revocation and how it is broken in practice](https://medium.com/@alexeysamoshkin/how-ssl-certificate-revocation-is-broken-in-practice-af3b63b9cb3) from January 2018
---

template: inverse

# TLS

---

# Introduction

- TLS is a _network protocol_ that uses hybrid cryptography for endpoint authentication and encrypted traffic

- Transport Layer Security

- New name for Secure Sockets Layer (SSL)

- Many people still say SSL when they really mean TLS

---

# History

- Lost in the mists of time: SSL 1.0 and SSL 2.0, created by Netscape

- 1996: SSL 3.0

- 1999: TLS 1.0, defined in [RFC 2246](https://tools.ietf.org/html/rfc2246)

- 2006: TLS 1.1, defined in [RFC 4346](https://tools.ietf.org/html/rfc4346)

- 2008: TLS 1.2, defined in [RFC 5246](https://tools.ietf.org/html/rfc5246)

- 2018: TLS 1.3, defined in [RFC 8446](https://tools.ietf.org/html/rfc8446)

- See [Differences between SSL and TLS Protocol Versions (#TLS13)](https://www.wolfssl.com/differences-between-ssl-and-tls-protocol-versions-3/)

---

# Swerve: What's a Network Protocol?

- How computers talk to each other

- Almost like a script:

 - I say this
 
 - You say that
 
 - ...

- More on protocols in week 10

- Simple example: HTTP

---

# The Internet is a Public Network

- Anything you send to another computer travels on the equivalent of postcards

- Any WiFi you use can see all your traffic

- Any intermediate network points can see all your traffic

 - Internet providers
 
 - Telecommunications companies
 
 - Nations
 
 - Intruders

- Encrypting network traffic helps preserve confidentiality

---

# On the Internet, No One Knows You're a Dog

- When you browse to Amazon.com, how do you know it's really them?

- Given the open and public nature of the Internet, couldn't an attacker impersonate web sites?

- PKIX saves the day

- If Amazon.com is the only one that has their private key, then you should be able to use their public key to safely communicate

- TLS is the magic that makes this happen

---

# TLS is for Authentication and Confidentiality

- TLS is a protocol for two parties

 - The _server_ waits for incoming connections
 
 - The _client_ initiates a conversation with a server

- Either side can present a cryptographic certificate and a signed message to authenticate itself

- The client and server use a key agreement protocol to create a session key, which encrypts the remainder of the conversation

- Almost everything that happens with TLS is authenticated on one side only

 - Your browser connects without authenticating and a web server identifies itself with a certificate

---

# From the Client Side, Pretty Simple

- Usually it is just as simple to get a TLS connection as it is to get a socket connection

- Comes somehwat for "free" and gives you some assurance of confidentiality and server authentication, if you set it up right

---

# Without TLS (Staight Sockets)

```python
import socket

payload = "HEAD / HTTP/1.1\n\n"

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

s.connect(("www.google.com", 80))
s.send(payload.encode('utf-8'))
print(s.recv(1024).decode('utf-8'))

s.close()
```

---

# With TLS, including Certificate Verification

```python
import socket
import ssl

payload = "HEAD / HTTP/1.1\n\n"

rs = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s = ssl.wrap_socket(rs, ciphers="HIGH:-aNULL:-eNULL:-PSK:RC4-SHA:RC4-MD5",
                        cert_reqs=ssl.CERT_REQUIRED,
                        ca_certs='/etc/ssl/certs/ca-certificates.crt')

s.connect(("www.google.com", 443))
s.send(payload.encode('utf-8'))
print(s.recv(1024).decode('utf-8'))

s.close()
```
---

# AEAD Revisited

- You can see how cryptographic primitives can supply the confidentiality, integrity, and authentication requirements of TLS

- Up until TLS 1.3, various algorithms could be used for the various functions

 - Like RSA for authentication
 
 - Or DH for key exchange
 
 - AES for encryption
 
 - SHA256 for integrity

- But some cipher modes provide confidentiality and encryption at the same time

 - Think how in CBC, each block depends on the previous block
 
 - But some things, like network packet headers, need to be in plaintext
 
 - This is Authenticated Encryption with Associated Data (AEAD)

---

# TLS Cipher Suites

- TLS makes heavy use of cryptography for a variety of purposes

- A _cipher suite_ describes a set of algorithms

- Before TLS 1.3, cipher suite includes:

 - Key exchange (e.g. ECDH)
 
 - Authentication (e.g. RSA)
 
 - Cipher (e.g. AES)
 
 - Hash (e.g. SHA256)

- TLS 1.3 uses a small set of cipher suites

 - AEAD (e.g. AES_256_GCM)
 
 - Hash (e.g. SHA384)
 
---

# Remember Key Agreement Protocols?

- Diffie-Hellman is a favorite

- When using RSA keys for TLS, the RSA private key is used as the basis of the key agreement

- If a private key ever leaks, then secret keys for all conversations can be determined

- Use _forward secrecy_ to defeat this

- Basically, create a new key pair just for the session, and use this for the key agreement protocol

- Use the server's "real" private key just for authentication

- In TLS 1.3, all cipher suites use forward secrecy

---

# Implementations

- `openssl` is very very big

- `matrixssl`

- `wolfSSL`

- See https://en.wikipedia.org/wiki/Comparison_of_TLS_implementations


