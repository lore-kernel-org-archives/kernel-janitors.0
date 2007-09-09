From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 09 Sep 2007 15:59:00 +0000
Subject: Re: Early userspace, Linux development (Re: perhaps init/ should
Message-Id: <Pine.LNX.4.64.0709091157540.15624@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0709080802430.8930@localhost.localdomain>
 <E1IUBUG-0003nA-W2@flower>
In-Reply-To: <E1IUBUG-0003nA-W2@flower>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Verych <olecom@flower.upol.cz>
Cc: Adrian Bunk <bunk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 9 Sep 2007, Oleg Verych wrote:

> * Sat, 8 Sep 2007 08:08:06 -0400 (EDT)
> []
> >   from init/do_mounts_rd.c:
> >
> > ...
> []
> >         if (rd_prompt)
> >                 change_floppy("root floppy disk to be loaded into RAM disk");
> >         create_dev("/dev/root", ROOT_DEV);
> >         create_dev("/dev/ram", MKDEV(RAMDISK_MAJOR, n));
> >         return rd_load_image("/dev/root");
> > }
> > ...
> >
> >   but isn't it a bit archaic to suggest that an explicit ramdisk will
> > be found only on a floppy?  can't one be provided on a CD or DVD?
> > just suggesting that the terminology could probably be updated.
>
> All this is userspace code, ugly, unmaintained and all that kind of
> things.
>
> = Kernel panics without userspace, do you need such kernel? =

um ... all i asked was whether that code should be updated to reflect
more than just floppies.  i didn't foresee the can of worms here.

rday


--
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
