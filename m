From: randy_dunlap <rdunlap@xenotime.net>
Date: Mon, 11 Jul 2005 02:38:41 +0000
Subject: [KJ] Fw: Re: [PATCH 0/82] changing CONFIG_LOCALVERSION rebuilds too
Message-Id: <20050710193841.5ca45be9.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49797388570766232=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49797388570766232==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


FYI:  Just a couple of emails about [not] over-splitting patches.
From lkml.

I don't know if such a huge patchbomb would kill the OSDL mail server,
but even if not, it's still not the right thing to do (IMHO).

~Randy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Begin forwarded message:

Date: Sun, 10 Jul 2005 14:49:10 -0700 (PDT)
From: "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 0/82] changing CONFIG_LOCALVERSION rebuilds too much, for no good reason.


An 82 entry patchbomb to the mailing lists is unacceptable and is
going to kill vger.kernel.org, please don't do this.

If you cannot condense your patch set into a smaller set of patches (I
think you really could for this one), then only post say 10 or so at a
time and wait for review and integration.

Kernel janitor-like patches split up their work _FAR_ too much.  They
post one patch per driver, or even per-file, for something as simple
as removing the use of a redundant header file.  That's totally
rediculious, and bloats up the kernel changelog history for no good
reason.  Instead, you should just post one big patch for all of
drivers/, one for all of net/, something like that.

Thanks.
-

and another:


From:	Jeff Garzik <jgarzik@pobox.com>
CC:	Andrew Morton <akpm@osdl.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/82] changing CONFIG_LOCALVERSION rebuilds too much, for no good reason.
Date:	Sun, 10 Jul 2005 18:23:06 -0400

> The following series of patches removes almost all inclusions
> of linux/version.h. The 3 #defines are unused in most of the touched files.
> 
> A few drivers use the simple KERNEL_VERSION(a,b,c) macro, which is unfortunatly
> in linux/version.h. This define moved to linux/utsname.h
> 
> There are also lots of #ifdef for long obsolete kernels, this will go as well.

I agree with most of the changes (and I say "most" simply because I 
haven't reviewed all of them), but it would be better to coalesce these 
100+ patches into much smaller patch clumps.

"split your patches up" mantra can get taken too far.  We want -logical 
changes- separated out, and your patches are largely a single logical 
change (remove old code).

---

--===============49797388570766232==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49797388570766232==--
