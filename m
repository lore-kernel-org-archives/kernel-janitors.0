From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 05:24:50 +0000
Subject: Re: [leds:for-next 18/18] drivers/leds/leds-lm3530.c:432 lm3530_probe() info: why not propagate 'err
Message-Id: <20120912052450.GA23490@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120912042018.GA22810@localhost>
In-Reply-To: <20120912042018.GA22810@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> > I think the intention of the warning is that the err value from
> > lm3530_init_registers() can be directly returned, like this:
> >
> >                   err = lm3530_init_registers(drvdata);
> >                   if (err < 0) {
> >                           dev_err(&client->dev,
> >                                   "Register Init failed: %d\n", err);
> > -                         return -ENODEV;
> > +                         return err;
> >                   }
> >
> > That will remove the assumption that lm3530_init_registers() always
> > returns -ENODEV on error.
> 
> Oh OK. Now I got it :)
> Thanks for the clarification.
> Since this was a prevalent issue with this driver (and maybe with
> other driver too?), I will send a patch to fix this up.

Yes, I think so.. Thank you very much!

Thanks,
Fengguang
