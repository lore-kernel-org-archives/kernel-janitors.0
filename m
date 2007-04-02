From: "Dan Carpenter" <error27@gmail.com>
Date: Mon, 02 Apr 2007 20:35:14 +0000
Subject: Re: [KJ] [PATCH][revised] : request_region auditing
Message-Id: <a63d67fe0704021335s3f64cce4p886a8700ac750e2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1175450907.3396.6.camel@localhost.localdomain>
In-Reply-To: <1175450907.3396.6.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/2/07, Brendan Burns <bburns@cs.umass.edu> wrote:
> Hey Dan,
> thanks for the patience and the comments.
>

No problem.  That's the point of this list is to be a friendly place
for newbie kernel hackers.

> In this patch, though, I have a question.
> > > --- linux-2.6.20.4.orig/drivers/net/hamradio/scc.c      2007-03-31
> > > 22:29:44.000000000 -0400
> > > +++ linux-2.6.20.4/drivers/net/hamradio/scc.c   2007-03-31
> > > 22:30:44.000000000 -0400
> > > @@ -1808,8 +1808,10 @@ static int scc_net_ioctl(struct net_devi
> > >
> > >                                 if (found)
> > >                                 {
> > > -                                       request_region(SCC_Info[2*Nchips+chan].ctrl, 1, "scc ctrl");
> > > -                                       request_region(SCC_Info[2*Nchips+chan].data, 1, "scc data");
> > > +                                       if (!request_region(SCC_Info[2*Nchips+chan].ctrl, 1, "scc ctrl"))
> > > +                                               return -EBUSY;
> > > +                                       if (!request_region(SCC_Info[2*Nchips+chan].data, 1, "scc data"))
> > > +                                               return -EBUSY;
> > >                                         if (Nchips+chan != 0 &&
> > >                                             scc_net_alloc(device_name,
> > >                                                           &SCC_Info[2*Nchips+chan]))
> > >                                                 return -EINVAL;
> > If the first request succeeds and the second request fails it needs to clean up.
>
> The last line in the "if (Nchips+chan ...)" after my patch returns
> -EINVAL without cleaning up the request_regions. Is this incorrect also?
> Note that this is the way the original code is written.  I'm happy to
> fix up this bug too, I just wanted to verify that it was in fact a bug.
>

Yes.  That is a bug.

It needs to clean up on the error paths.  To be honest I didn't do a
very thourough job auditing so there may be other places that need
cleaned up as well.

regards,
dan carpenter
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
