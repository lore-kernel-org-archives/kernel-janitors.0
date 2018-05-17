From: Tony Lindgren <tony@atomide.com>
Date: Thu, 17 May 2018 22:03:05 +0000
Subject: Re: [bug report] bus: ti-sysc: Add handling for clkctrl opt clocks
Message-Id: <20180517220305.GA77025@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180517124514.GA9149@mwanda>
In-Reply-To: <20180517124514.GA9149@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [180517 07:03]:
> * Dan Carpenter <dan.carpenter@oracle.com> [180517 12:47]:
> >    143          ddata->clocks[index] = devm_clk_get(ddata->dev, name);
> >    144          if (IS_ERR(ddata->clocks[index])) {
> >    145                  if (PTR_ERR(ddata->clocks[index]) = -ENOENT)
> >    146                          return 0;
> >    147  
> >    148                  dev_err(ddata->dev, "clock get error for %s: %li\n",
> >    149                          name, PTR_ERR(ddata->clocks[index]));
> >    150  
> > 
> > Should we set ddata->clocks[index] = NULL on this path?
> 
> Maybe yeah. At least if clk_prepare later on fails we want to set it to
> either to NULL or error to prevent clk_enable() being called on a failed
> clock.

Looks like no need, we're bailing out of the probe anyways on errors.
And the clock_enable/disable calls do IS_ERR_OR_NULL(ddata->clocks[i]).

I'll send out the fix shortly.

Regards,

Tony
