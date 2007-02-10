From: Bernd Petrovitsch <bernd@firmix.at>
Date: Sat, 10 Feb 2007 18:55:03 +0000
Subject: Re: [KJ] is there a short form for "memset(blah, 0, len)"?
Message-Id: <1171133703.10714.45.camel@gimli.at.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702101112510.4576@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702101112510.4576@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 2007-02-10 at 13:25 -0500, Robert P. J. Day wrote:
> On Sat, 10 Feb 2007, Bernd Petrovitsch wrote:
> 
> > On Sat, 2007-02-10 at 11:14 -0500, Robert P. J. Day wrote:
> > >   i doubt anything will ever come of this but, given the number of
> > > calls to "memset(addr, 0, len)", did anyone ever consider defining a
> > > macro short form, say:
> > >
> > >   clearmem(addr, len)
> > >   zeromem(addr, len)
> >
> > *BSD had "bzero()".
> >
> > > or something like that?  just curious.
> >
> > Did you ever read the man page of "bzero()"?
> 
> sure, but that's a *userspace* routine.  AFAIK, there is no such

Yes, of course. I mentioned it because there is/was already a function
with the above semantics and signature. So why invent another name?

> routine in the linux kernel.  is there a reason there isn't?  wouldn't

No, because bzero() is - according to the man page - deprecated.

> it be kind of useful?

I don't think so. But who knows what maintainers and others higher in
the food chain think .....

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
