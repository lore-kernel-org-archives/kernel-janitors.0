From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 07 Feb 2005 09:14:40 +0000
Subject: Re: [KJ] Introduction...
Message-Id: <42074DA0.6732.1AE1A7@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49605097281011457=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4206AF91.9315.17FD337@localhost>
In-Reply-To: <4206AF91.9315.17FD337@localhost>
To: kernel-janitors@vger.kernel.org

--===============49605097281011457==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

On 6 Feb 2005 at 21:51, Jim Nelson wrote:

> Stephen Biggs wrote:
> > Greetings all,
> > 
> > Domen Puncer knows me as "GuestMe" on the IRC channel.
> > 
> > I would like to introduce myself as someone who wishes to join the 
> > kernel-janitors team in order to help out. My hardware is pretty much 
> > run-of-the-mill: P4P-800VM motherboard, Pentium IV 2.4GHz, dual-boot 
> > with Windows, Fedora Core 3 fully updated as of yesterday, including 
> > kernel, 2 IDE drives and one SATA drive, one of the IDE drives being my 
> > Linux disk, two DVD drives, one of which writes single-layer DVD, 1394 
> > video capture card and an Adaptec SCSI card for a negative scanner.
> > 
> > Domen has told me that there are only 5 of you?
> > 
> 
> Dunno.  As regular contributors, maybe.  More people pop in every once in awhile 
> (like myself).

Hi Jim,

Thanks for the reply.

> 
> > I understand that the TODO list on the website is out of date and needs 
> > updating... What are some of the outstanding and high-priority tasks to 
> > do that no one has started doing?
> > 
> 
> Fixing compile warnings.  Especially on unmaintained drivers.  A `make 
> allyesconfig && make bzImage 2>warnings.txt` is a great way to start.

I will try it with cygwin, then, once I have a patch, I'll move it over 
to Linux and make sure it does what I think it should do before I submit. 
 
>  There's 
> running compiles with the gcc 4 beta, and fixing the new compile warnings that 
> generates.

Isn't this already being done by one or more people?  I have seen this in 
the archives and I don't want to duplicate work, even though this sounds 
interesting.  Can someone advise and help me coordinate this task?

>  There's also learning how to use sparse, and tackling what it turns up 

> (I'm not to that level, tho...).  People are working on them IIRC, but there's a 
> lot of work to be done.

This is my question... all I see is the TODO list which, IMHO, doesn't 
show the huge amount of work to do that your above statement seems to 
imply.

> 
> Work off of -mm, since most of the janitorial work will go through Andrew Morton's 
> series for awhile before being pushed into mainline.  I've had a few times when 
> I've duplicated work in the -mm tree, only finding out *after* I sent the patches...

Ok, so how do I do that?

I am assuming that  
http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/ is where 
I find the -mm stuff?  "akpm" is Andrew Morton?

Ok, so I download the latest patch (which right now is 
http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.11-
rc3/2.6.11-rc3-mm1/2.6.11-rc3-mm1.gz.

Then I download the latest testing kernel with the release that matches 
the above patch: 
http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.11-
rc3.tar.gz, apply the patch and go for it.

Do I have it right?

> 
> There's always whitespace cleanup.  Unglamorous but helpful.  Not everyone doing 
> cleanup works through this mailing list (Adrian Bunk is the most prolific on LKML) 
> but it is a good place to start kernel work.
> 
> Welcome.

Thanks much!

Steve



--===============49605097281011457==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49605097281011457==--
