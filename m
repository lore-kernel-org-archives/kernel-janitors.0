From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Wed, 15 Mar 2006 16:51:51 +0000
Subject: Re: [KJ][Patch] coding style cleanp in pcnet_cs.c
Message-Id: <20060315085151.20fa0efe.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13388434237772406=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1142231320.7791.44.camel@localhost.localdomain>
In-Reply-To: <1142231320.7791.44.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============13388434237772406==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Mar 2006 17:28:40 +1100 Darren Jenkins\\ wrote:

> G'day list.
> 
> Here is the coding style fix-up patch for pcnet_cs.c.
> It is mostly altering the indentation but does contain a few other small
> changes.
> 
> Also this one should apply on top of the other pcnet_cs.c patch, instead
> of including the eirlier patch like the axnet_cs.c coding style patch
> did.
> 
> This one is compile tested :).


I have no comments on this specific patch nor time to look over
a 70 KB (this one) or 50 KB (i82365.c) patch.

However, coding style patches should be that and nothing else, so
hopefully that is the *only* thing in these patches.  In theory
one could build a .o file before and after the patch and compare
the 2 .o files and the only difference would be in the binary
date in the ELF headers.  (I say in theory, but I actually did
that [successfully] for coding style fixes to block/floppy.c.)
It does remove some doubts about the patch (at least for me).

Second comment (totally up to Alexey IMO):  I don't see coding
style cleanups in the current TODO list.  Their main usefulness
is for code that is ugly as sin but still has to be worked
on a fair amount (like floppy.c).

---
~Randy

--===============13388434237772406==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13388434237772406==--
