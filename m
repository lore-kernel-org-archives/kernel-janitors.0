From: Jim Nelson <james4765@cwazy.co.uk>
Date: Mon, 07 Feb 2005 02:51:57 +0000
Subject: Re: [KJ] Introduction...
Message-Id: <4206D7CD.8060003@cwazy.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70778680316520393=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4206AF91.9315.17FD337@localhost>
In-Reply-To: <4206AF91.9315.17FD337@localhost>
To: kernel-janitors@vger.kernel.org

--===============70778680316520393==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Stephen Biggs wrote:
> Greetings all,
> 
> Domen Puncer knows me as "GuestMe" on the IRC channel.
> 
> I would like to introduce myself as someone who wishes to join the 
> kernel-janitors team in order to help out. My hardware is pretty much 
> run-of-the-mill: P4P-800VM motherboard, Pentium IV 2.4GHz, dual-boot 
> with Windows, Fedora Core 3 fully updated as of yesterday, including 
> kernel, 2 IDE drives and one SATA drive, one of the IDE drives being my 
> Linux disk, two DVD drives, one of which writes single-layer DVD, 1394 
> video capture card and an Adaptec SCSI card for a negative scanner.
> 
> Domen has told me that there are only 5 of you?
> 

Dunno.  As regular contributors, maybe.  More people pop in every once in awhile 
(like myself).

> I understand that the TODO list on the website is out of date and needs 
> updating... What are some of the outstanding and high-priority tasks to 
> do that no one has started doing?
> 

Fixing compile warnings.  Especially on unmaintained drivers.  A `make 
allyesconfig && make bzImage 2>warnings.txt` is a great way to start.  There's 
running compiles with the gcc 4 beta, and fixing the new compile warnings that 
generates.  There's also learning how to use sparse, and tackling what it turns up 
(I'm not to that level, tho...).  People are working on them IIRC, but there's a 
lot of work to be done.

Work off of -mm, since most of the janitorial work will go through Andrew Morton's 
series for awhile before being pushed into mainline.  I've had a few times when 
I've duplicated work in the -mm tree, only finding out *after* I sent the patches...

There's always whitespace cleanup.  Unglamorous but helpful.  Not everyone doing 
cleanup works through this mailing list (Adrian Bunk is the most prolific on LKML) 
but it is a good place to start kernel work.

Welcome.

Jim



--===============70778680316520393==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70778680316520393==--
