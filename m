From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 28 Dec 2005 21:39:38 +0000
Subject: Re: [KJ] [PATCH] Deinitialise static variables in net/core/pktgen.c
Message-Id: <200512282139.39139.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <17299.192.96.150.57.1135065563.squirrel@mail.interexcel.co.za>
In-Reply-To: <17299.192.96.150.57.1135065563.squirrel@mail.interexcel.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 20 December 2005 07:59, Jaco Kroon wrote:
> static variables should not be explicitly initialised to 0.  This causes
> them to be placed in .data instead of .bss.  This patch de-initialises 3
> static variables in net/core/pktgen.c.
> 
> There are approximately 800 more such variables in the source tree
> (2.6.15rc5).  If there is more interrest I'd be willing to track down the
> rest of these as well and de-initialise them as well.

Can we please remove this item from the janitor todo list?
Most distro-supplied compilers (gcc versions 3.4 or later)
do this automatically, so there is very little gain in this
(if there ever was -- we're only talking about object file
size here anyway, not memory consumption).

I know that this is everyone's favorite janitor item when you
start, because it's so easy to do, but do we really care any
more or is this just adding noise to the ChangeLog?

[Sorry Jaco for picking out your patch, but this has been going
 on for some time]

	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
