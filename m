From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 14 May 2007 17:36:50 +0000
Subject: Re: [KJ] weird Kconfig excerpt in Documentation/CodingStyle
Message-Id: <Pine.LNX.4.64.0705141333001.14225@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705141227040.13741@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705141227040.13741@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 14 May 2007, Randy Dunlap wrote:

> On Mon, 14 May 2007 13:09:48 -0400 (EDT) Robert P. J. Day wrote:
>
> > On Mon, 14 May 2007, Randy Dunlap wrote:
> >
> > > On Mon, 14 May 2007 12:28:23 -0400 (EDT) Robert P. J. Day wrote:
> >
> > > > if CONFIG_EXPERIMENTAL
> > > >         tristate CONFIG_BOOM
> > > >         default n
> > > >         help
> > > >           Apply nitroglycerine inside the keyboard (DANGEROUS)
> > > >         bool CONFIG_CHEER
> > > >         depends on CONFIG_BOOM
> > > >         default y
> > > >         help
> > > >           Output nice messages when you explode
> > > > endif
> > > > ...
> > > >
> > > >   that just looks so wrong in so many ways.
> > >
> > > but none are listed here...
> >
> > sorry, i thought it was self-evident.
>
> > since when did Kconfig files
> > include conditional checks of the form "if CONFIG_EXPERIMENTAL"?  or,
>
> There are plenty of
> if <SYMBOL>
> lines in Kconfig files, although SYMBOL = EXPERIMENTAL isn't one
> of them, but it could be.

but that snippet doesn't use "EXPERIMENTAL", it uses
"CONFIG_EXPERIMENTAL".  my point was that Kconfig files get to define
symbols like "FUBAR", while the corresponding checks for
"CONFIG_FUBAR" are done *outside* of Kconfig files.  for any Kconfig
file to refer to a symbol with a prefix of "CONFIG_" is simply wrong,
at least the way i read it.

and, as you've noticed, the rest of that snippet is similarly absurd.
i'll throw a patch together when i get a chance, unless someone else
wants to take a crack at it.

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
