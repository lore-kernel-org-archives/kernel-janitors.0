From: Tony Lindgren <tony@atomide.com>
Date: Thu, 17 May 2018 14:03:02 +0000
Subject: Re: [bug report] bus: ti-sysc: Add handling for clkctrl opt clocks
Message-Id: <20180517140302.GO25808@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180517124514.GA9149@mwanda>
In-Reply-To: <20180517124514.GA9149@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

* Dan Carpenter <dan.carpenter@oracle.com> [180517 12:47]:
> Hello Tony Lindgren,
> 
> The patch 09dfe5810762: "bus: ti-sysc: Add handling for clkctrl opt
> clocks" from Apr 16, 2018, leads to the following static checker
> warning:
> 
> 	drivers/bus/ti-sysc.c:131 sysc_get_one_clock()
> 	error: buffer overflow 'clock_names' 2 <= 9
> 
> drivers/bus/ti-sysc.c
>    120  static int sysc_get_one_clock(struct sysc *ddata, const char *name)
>    121  {
>    122          int error, i, index = -ENODEV;
>    123  
>    124          if (!strncmp(clock_names[SYSC_FCK], name, 3))
>    125                  index = SYSC_FCK;
>    126          else if (!strncmp(clock_names[SYSC_ICK], name, 3))
>    127                  index = SYSC_ICK;
>    128  
>    129          if (index < 0) {
>    130                  for (i = SYSC_OPTFCK0; i < SYSC_MAX_CLOCKS; i++) {
>    131                          if (!clock_names[i]) {
>                                      ^^^^^^^^^^^^^^
> This isn't right.  The clock_names[] array only has the two elements...
> Probably it should be testing ddate->clocks[i]?

Yup so it seems. Will take a look today.


>    143          ddata->clocks[index] = devm_clk_get(ddata->dev, name);
>    144          if (IS_ERR(ddata->clocks[index])) {
>    145                  if (PTR_ERR(ddata->clocks[index]) = -ENOENT)
>    146                          return 0;
>    147  
>    148                  dev_err(ddata->dev, "clock get error for %s: %li\n",
>    149                          name, PTR_ERR(ddata->clocks[index]));
>    150  
> 
> Should we set ddata->clocks[index] = NULL on this path?

Maybe yeah. At least if clk_prepare later on fails we want to set it to
either to NULL or error to prevent clk_enable() being called on a failed
clock.

Regards,

Tony
