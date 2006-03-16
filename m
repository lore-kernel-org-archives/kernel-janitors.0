From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Thu, 16 Mar 2006 04:14:20 +0000
Subject: Re: [KJ][Patch] coding style cleanp in pcnet_cs.c
Message-Id: <20060315201420.1bb08abe.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12507086666460143=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1142231320.7791.44.camel@localhost.localdomain>
In-Reply-To: <1142231320.7791.44.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============12507086666460143==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 16 Mar 2006 09:19:49 +1100 Darren Jenkins wrote:

> > However, coding style patches should be that and nothing else, so
> > hopefully that is the *only* thing in these patches.  In theory
> 
> I hope so to.
> 
> > one could build a .o file before and after the patch and compare
> > the 2 .o files and the only difference would be in the binary
> > date in the ELF headers.  (I say in theory, but I actually did
> > that [successfully] for coding style fixes to block/floppy.c.)
> > It does remove some doubts about the patch (at least for me).
> 
> Sounds good, I don't know anything about elf binaries but would there
> be debugging info in them that would be different also ?
> Exactly how should you compare two elf binaries? I will go check if
> there is a diff option for checking binary files, but have no real
> idea otherwise.

I used 'cmp' to compare the files.  They were (have to be) the same
size for cmp IIRC.  There were only a few bytes of difference near
the beginning of the files.  If you only get about 6-8 bytes of diff
in the first 1024 bytes or so, you are good to go.

> > Second comment (totally up to Alexey IMO):  I don't see coding
> > style cleanups in the current TODO list.  Their main usefulness
> > is for code that is ugly as sin but still has to be worked
> > on a fair amount (like floppy.c).
> 
> Well I am a pedantic bastard, and tend to do stuff like this, not
> because it is on a list of stuff to do, but mostly because it annoys
> me. I have split the changes so Alexey can reject the clean ups if he
> wants.
> I will try to refrain from it in future, but can't guarantee anything. :)

I understand.  It annoys me too.

---
~Randy

--===============12507086666460143==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12507086666460143==--
