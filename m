From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 14 May 2007 17:36:21 +0000
Subject: Re: [KJ] weird Kconfig excerpt in Documentation/CodingStyle
Message-Id: <20070514103621.cb5c1821.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0705141227040.13741@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0705141227040.13741@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 14 May 2007 13:09:48 -0400 (EDT) Robert P. J. Day wrote:

> On Mon, 14 May 2007, Randy Dunlap wrote:
> 
> > On Mon, 14 May 2007 12:28:23 -0400 (EDT) Robert P. J. Day wrote:
> 
> > > if CONFIG_EXPERIMENTAL
> > >         tristate CONFIG_BOOM
> > >         default n
> > >         help
> > >           Apply nitroglycerine inside the keyboard (DANGEROUS)
> > >         bool CONFIG_CHEER
> > >         depends on CONFIG_BOOM
> > >         default y
> > >         help
> > >           Output nice messages when you explode
> > > endif
> > > ...
> > >
> > >   that just looks so wrong in so many ways.
> >
> > but none are listed here...
> 
> sorry, i thought it was self-evident.

Thanks for the good list.

> since when did Kconfig files
> include conditional checks of the form "if CONFIG_EXPERIMENTAL"?  or,

There are plenty of
if <SYMBOL>
lines in Kconfig files, although SYMBOL = EXPERIMENTAL isn't one
of them, but it could be.

> for that matter, have *any* references with a "CONFIG_" prefix or
> define options that way?

ack.

> or define help info immediately followed by
> an invalid "bool" declaration?  really, the list just goes on.

Yes, a blank line is missing there.

Care to send a patch?

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
