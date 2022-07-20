# NimScan
+ Port Scanner built with Nim

This is a quick & dirty port scanner I "whipped up" to learn more about the Nim programming language.
It's pretty junk, but hey, I'm learning here. :)
        
<T5>Installation</T>
====
  - Install Nim
    + https://nim-lang.org/install.html
  - Clone the repo
    + `git clone https://github.com/daniellowrie/NimScan.git`
  - Build `nimscan`
    + `nim c -d:release nimscan.nim`
      - To Cross-Compile For Windows from Linux:
        + You'll need MinGW installed on your Linux system
          - https://nim-lang.org/docs/nimc.html#crossminuscompilation-for-windows

<T5>Usage</T>
+ Use is pretty straight forward, and has 2 modes of operation...
  1. *Command-Line Mode*
  2. *Interactive Mode*

+ **Command-Line Mode**
  - You pass all the parameters to nimscan
    + ./nimscan targetIP/hostname START_port END_port 
    + `./nimscan 192.168.1.81 20 1024`
    + `./nimscan scanme.nmap.org 20 1024`

+ **Interactive Mode*
  - You just run `nimscan` without any arguments and you'll be asked for the necessary elements
    + ```
      ./nimscan
      TargetIP: 192.168.1.81
      START Port: 20
      END Port: 1024
      
      Nim Port Scanner
      ================
      Port Open: 22
      Port Open: 80
      ```
      - You can use a hostname or IP address for 'TargetIP'


A few issues...
===
+ I can only can 1023 ports at a time. 
  - The socket connection opens File Descriptors
    + I'm not yet sure how to close them.
      - the std/net proc close() doesn't seem to do it
    + Generates `Error: unhandled exception: Too many open files [OSError]`
      - That said, I've been able to scan 1000 ports against Internet-facing hosts in about 2 min

+ Windows Defender thinks that Nim is Malware
  - If you install Nim on Windows, there is a decent chance that Defender will flag it as malware
    + This is due to the fact that Nim has been used in the recent past to create malware
      - AV vendors went the easy route of just dropping the hammer on Nim it seems
        + Even your cross-compiled EXEs will get busted
          - Sometimes a quick reinstall of Nim fixes this

+ Command-Line Mode is **ALL** or **NOTHING!**
  - Nim causes errors if you don't use the expected amount of arguments
    + Therefore you can use NO command-line args (aka Interactive Mode)
    + Or you must supply ALL the expected args, lest ye suffer a fatal error! ARRGGHH!!!
