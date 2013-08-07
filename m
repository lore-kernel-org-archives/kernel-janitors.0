From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 07 Aug 2013 09:49:47 +0000
Subject: Re: commas
Message-Id: <alpine.DEB.2.02.1308071149170.2259@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1308071113570.2259@hadrien>
In-Reply-To: <alpine.DEB.2.02.1308071113570.2259@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 7 Aug 2013, Richard Genoud wrote:

> 2013/8/7 Julia Lawall <julia.lawall@lip6.fr>:
> >
> >
> > On Wed, 7 Aug 2013, Richard Genoud wrote:
> >
> >> 2013/8/7 Julia Lawall <julia.lawall@lip6.fr>:
> >> > There are a number of places where kernel code uses commas, where one
> >> > might normally expect a semicolon.  For example,
> >> >
> >> > drivers/cpufreq/sparc-us2e-cpufreq.c:
> >> >
> >> >                 driver->target = us2e_freq_target;
> >> >                 driver->get = us2e_freq_get;
> >> >                 driver->exit = us2e_freq_cpu_exit;
> >> >                 driver->owner = THIS_MODULE,     <------------- comma here
> >> >                 strcpy(driver->name, "UltraSPARC-IIe");
> >> >
> >> >                 cpufreq_us2e_driver = driver;
> >> >                 ret = cpufreq_register_driver(driver);
> >> >
> >> > Is there any reason for this?  I guess that they are not very harmful, but
> >> > if one happens to write a static checker rule that expects a ;, then this
> >> > code will be overlooked.
> >> Hi Julia,
> >>
> >> IMHO, the only reason there's a comma there is because the comma key
> >> is next to the semi-colon on some keyboards :) (the french one for
> >> instance).
> >>
> >> Clearly, that was not intended here. I think it should be corrected.
> >
> > OK, thanks.  To be clear, this is not an isolated example.  There are over
> > 500 of them, in 129 files.  But I can't imagine why any of them should be
> > there.
> ouch !
> That's quite a lot !
> I was thinking about what nasty things could happen with that operator
> when it is used instead of the semi-colon.
> I could only think of something like that:
> if (foo)
>  a=1,
>  b=2;
> (same with loops)

Thanks for the tip.  I will definitely look out for that.

julia
