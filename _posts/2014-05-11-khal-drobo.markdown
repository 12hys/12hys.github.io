---
layout: post
title: "Khal Drobo"
date: 2014-05-11 23:42:36 -0400
comments: true
categories: 
---

I just recently bought a [Drobo 5N](http://www.amazon.com/Drobo-Storage-Gigabit-Ethernet-DRDS4A21/dp/B00AMAJGOO), and stuffed it with 5x [3TB WD Red](http://www.amazon.com/WD-Red-NAS-Hard-Drive/dp/B008JJLW4M/ref=sr_1_1?ie=UTF8&qid=1399866340&sr=8-1&keywords=wd+red+3tb) drives.

Overall, it's been a pretty decent experience. Transfer speeds have been really good, but I did notice that the Plex Media Server performance could use a lot of work.

The point of this post was to make a note of the mounting instructions for Ubuntu. Install CIFS with `sudo apt-get install cifs-utils`. Then add these lines to `/etc/fstab`:

    //khal-drobo.local/movies /home/rhys/Movies/ cifs uid=rhys,credentials=/home/rhys/.smbcredentials,user 0 0
    //khal-drobo.local/tv     /home/rhys/TV/     cifs uid=rhys,credentials=/home/rhys/.smbcredentials,user 0 0
    //khal-drobo.local/data   /home/rhys/Data/   cifs uid=rhys,credentials=/home/rhys/.smbcredentials,user 0 0
    //khal-drobo.local/music  /home/rhys/Music/  cifs uid=rhys,credentials=/home/rhys/.smbcredentials,user 0 0

Create a `~/.smbcredentials` file with the following lines followed by `chmod 600 ~/.smbcredentials`.

    username=rhys
    password=enterpasshere

If mounting as a guest (shares with only read guest permissions):

	//khal-drobo.local/music /home/rhys/Music/ cifs guest 0 0