From: Joe Perches <joe@perches.com>
Date: Mon, 27 Nov 2017 17:26:05 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <1511803565.32426.52.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
         <alpine.DEB.2.20.1711260648130.2387@hadrien>
         <1511676085.20482.18.camel@perches.com>
         <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>
         <1511735382.20482.27.camel@perches.com>
         <alpine.DEB.2.20.1711262334370.2111@hadrien>
         <1511745165.20482.34.camel@perches.com>
         <alpine.DEB.2.20.1711270704420.2369@hadrien>
         <1511774737.32426.29.camel@perches.com>
         <6d424a99-7c3a-9d15-5651-030f52367749@deltatee.com>
In-Reply-To: <6d424a99-7c3a-9d15-5651-030f52367749@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>

On Mon, 2017-11-27 at 10:07 -0700, Logan Gunthorpe wrote:
> 
> On 27/11/17 02:25 AM, Joe Perches wrote:
> > []
> > diff -u -p a/lib/locking-selftest.c b/lib/locking-selftest.c
> > --- a/lib/locking-selftest.c
> > +++ b/lib/locking-selftest.c
> > @@ -1186,7 +1186,7 @@ static void dotest(void (*testcase_fn)(v
> > 
> >   static inline void print_testname(const char *testname)
> >   {
> > -	printk("%33s:", testname);
> > +	printk("%33s:\n", testname);
> >   }
> 
> Coincidentally, the checkpatch script does not hit this false positive. 
> This because a pr_cont actually follows in a #define. It doesn't feel 
> right but checkpatch does do the correct thing on this one.
> 
> > diff -u -p a/lib/dynamic_debug.c b/lib/dynamic_debug.c
> > --- a/lib/dynamic_debug.c
> > +++ b/lib/dynamic_debug.c
> > @@ -562,7 +562,8 @@ void __dynamic_pr_debug(struct _ddebug *
> >   	vaf.fmt = fmt;
> >   	vaf.va = &args;
> > 
> > -	printk(KERN_DEBUG "%s%pV", dynamic_emit_prefix(descriptor, buf), &vaf);
> > +	printk(KERN_DEBUG "%s%pV\n", dynamic_emit_prefix(descriptor, buf),
> > +	       &vaf);
> > 
> >   	va_end(args);
> >   }
> 
> This is a valid false positive that I also missed. However, it can 
> actually be very easily ignored by checking if the format string ends in 
> %pV. There were about 100 cases in my results that match this.

No, it can't be done that way.

$ git grep '%pV\\n"' | wc -l
56
$ git grep '%pV"' | wc -l
146

AFAIK: all of the above are correct as-is.

