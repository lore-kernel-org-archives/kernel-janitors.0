From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 07 Feb 2005 13:14:19 +0000
Subject: Re: [KJ] Introduction...
Message-Id: <420785CB.16664.3EC16E@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3501211519793479=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4206AF91.9315.17FD337@localhost>
In-Reply-To: <4206AF91.9315.17FD337@localhost>
To: kernel-janitors@vger.kernel.org

--===============3501211519793479==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

On 7 Feb 2005 at 6:26, Jim Nelson wrote:

> Stephen Biggs wrote:
> >>>I understand that the TODO list on the website is out of date and needs 
> >>>updating... What are some of the outstanding and high-priority tasks to 
> >>>do that no one has started doing?
> >>>
> >>
> >>Fixing compile warnings.  Especially on unmaintained drivers.  A `make 
> >>allyesconfig && make bzImage 2>warnings.txt` is a great way to start.
> > 
> > 
> > I will try it with cygwin, then, once I have a patch, I'll move it over 
> > to Linux and make sure it does what I think it should do before I submit. 
> >  
> 
> Don't limit yourself to x86.  There are less people looking at the less-popular 
> architectures.  Only problem is getting a working cross-compiler.  That's another 
> challenge I'm working my way up to.

Yes, I just discovered that cygwin is not up to the task at all.  
Straight Linux all the way.

> 
> > 
> >> There's 
> >>running compiles with the gcc 4 beta, and fixing the new compile warnings that 
> >>generates.
> > 
> > 
> > Isn't this already being done by one or more people?  I have seen this in 
> > the archives and I don't want to duplicate work, even though this sounds 
> > interesting.  Can someone advise and help me coordinate this task?
> > 
> 
> IIRC, it comes up with thousands of warnings - typecasts, etc.

Ok, but if I happen to jump into the same area that someone else is 
doing, this is a duplication of work and a pity, wasted effort.  This 
project needs some real management, and no, I am not a project manager; I 
know my limitations ;-)

> 
> > 
> >> There's also learning how to use sparse, and tackling what it turns up 
> > 
> > 
> >>(I'm not to that level, tho...).  People are working on them IIRC, but there's a 
> >>lot of work to be done.
> > 
> > 
> > This is my question... all I see is the TODO list which, IMHO, doesn't 
> > show the huge amount of work to do that your above statement seems to 
> > imply.
> > 
> 
> My experience is that there are not enough people doing it to have to worry 
> overmuch about running into someone else's work.  Who knows, your work might be 
> better than what someone else submitted, and might be accepted in its place.

Ah, perhaps, but the flip side to that is that it doesn't matter if 
either my work or someone else's work is accepted; this is duplicated 
work and effort and, again, a pity.

> 
> > 
> >>Work off of -mm, since most of the janitorial work will go through Andrew Morton's 
> >>series for awhile before being pushed into mainline.  I've had a few times when 
> >>I've duplicated work in the -mm tree, only finding out *after* I sent the patches...
> > 
> > 
> > Ok, so how do I do that?
> > 
> > I am assuming that  
> > http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/ is where 
> > I find the -mm stuff?  "akpm" is Andrew Morton?
> > 
> 
> Or the main www.kernel.org page - listed at the bottom of the releases.
> 
> akpm is Andrew Morton - the 2.6 maintainer.  -mm is always more experimental, and 
> most patches that might break things end up there for awhile (new arches, new 
> filesystems, driver API changes, etc).
> 
> > Ok, so I download the latest patch (which right now is 
> > http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.11-
> > rc3/2.6.11-rc3-mm1/2.6.11-rc3-mm1.gz.
> > 
> > Then I download the latest testing kernel with the release that matches 
> > the above patch: 
> > http://www.kernel.org/pub/linux/kernel/v2.6/testing/linux-2.6.11-
> > rc3.tar.gz, apply the patch and go for it.
> > 
> > Do I have it right?
> > 
> 
> Saves some bandwidth to do it this way:
> 
> $ tar xjf linux-2.6.10.tar.bz2
> $ bzip2 -d patch-2.6.11-rc3.bz2
> $ bzip2 -d 2.6.11-rc3-mm1.bz2
> $ mv linux-2.6.10 linux-2.6.11-rc3-mm1
> $ cd linux-2.6.11-rc3-mm1
> $ patch -p1 < ../patch-2.6.11-rc3
> $ patch -p1 < ../2.6.11-rc3-mm1
> $ make mrproper
> 
> That means you only have to download the full versions of each stable release, and 
> just get the -rcX and -mmX patches when they are released.  I rebuild the tree 
> every -mm release - helps keep cruft and weirdness from popping up when you're 
> doing test compiles.

Yes, this is a better way.  But, since I started out the other way, I'll 
continue with my way for this release and go to your way next time.

> 
> > 
> >>There's always whitespace cleanup.  Unglamorous but helpful.  Not everyone doing 
> >>cleanup works through this mailing list (Adrian Bunk is the most prolific on LKML) 
> >>but it is a good place to start kernel work.
> >>
> >>Welcome.
> > 
> > 
> > Thanks much!
> > 
> > Steve
> > 
> 
> Jim
> 

Steve


--===============3501211519793479==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3501211519793479==--
