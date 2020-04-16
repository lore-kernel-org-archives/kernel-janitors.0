From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Apr 2020 09:32:54 +0000
Subject: Re: [PATCH] thermal: ti-soc-thermal: remove redundant assignment to variable i
Message-Id: <20200416093254.GL1163@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200415224010.1564330-1-colin.king@canonical.com>
In-Reply-To: <20200415224010.1564330-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>, linux-pm@vger.kernel.org, linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 15, 2020 at 11:40:10PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable i is being assigned with a value that is never read,
> the assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/thermal/ti-soc-thermal/ti-bandgap.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.c b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
> index ab19ceff6e2a..abaf629038c3 100644
> --- a/drivers/thermal/ti-soc-thermal/ti-bandgap.c
> +++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
> @@ -1003,7 +1003,6 @@ int ti_bandgap_probe(struct platform_device *pdev)
>  		ret = ti_bandgap_talert_init(bgp, pdev);
>  		if (ret) {
>  			dev_err(&pdev->dev, "failed to initialize Talert IRQ\n");
> -			i = bgp->conf->sensor_count;
>  			goto disable_clk;
>  		}
>  	}

This isn't the right fix.  The goto is wrong.

The "i" variable comes from the iterator of the previous loop.  When
you're unwinding inside a loop then first undo the partial iteration
before doing a goto.

   979          /* Every thing is good? Then expose the sensors */
   980          for (i = 0; i < bgp->conf->sensor_count; i++) {
   981                  char *domain;
   982  
   983                  if (bgp->conf->sensors[i].register_cooling) {
   984                          ret = bgp->conf->sensors[i].register_cooling(bgp, i);
   985                          if (ret)
   986                                  goto remove_sensors;
   987                  }
   988  
   989                  if (bgp->conf->expose_sensor) {
   990                          domain = bgp->conf->sensors[i].domain;
   991                          ret = bgp->conf->expose_sensor(bgp, i, domain);
   992                          if (ret)
   993                                  goto remove_last_cooling;

So here we should do:

				if (ret) {
					if (bgp->conf->sensors[i].unregister_cooling)
						bgp->conf->sensors[i].unregister_cooling(bgp, i);
					goto remove_sensors;
				}
The line lengths are long so it would be cleaner to say:


			struct ti_temp_sensor *sensor = &bgp->conf->sensors[i];

at the start of the loop.

			if (ret) {
				if (sensor->unregister_cooling)
					sensor->unregister_cooling(bgp, i);
				goto remove_sensors;
			}


   994                  }
   995          }
   996  
   997          /*
   998           * Enable the Interrupts once everything is set. Otherwise irq handler
   999           * might be called as soon as it is enabled where as rest of framework
  1000           * is still getting initialised.
  1001           */
  1002          if (TI_BANDGAP_HAS(bgp, TALERT)) {
  1003                  ret = ti_bandgap_talert_init(bgp, pdev);
  1004                  if (ret) {
  1005                          dev_err(&pdev->dev, "failed to initialize Talert IRQ\n");
  1006                          i = bgp->conf->sensor_count;
  1007                          goto disable_clk;

This should be "goto remove_sensors;" as well.  The i assignment can
be deleted though because it already equals bgp->conf->sensor_count.

  1008                  }
  1009          }
  1010  
  1011          return 0;
  1012  
  1013  remove_last_cooling:
  1014          if (bgp->conf->sensors[i].unregister_cooling)
  1015                  bgp->conf->sensors[i].unregister_cooling(bgp, i);

Delete this partial unwind because we moved it before the goto.  Say
we add some more error conditions at the end of the function, then now
we can add more labels and it's not complicated with this partial
unwind.

  1016  remove_sensors:
  1017          for (i--; i >= 0; i--) {


It's slightly nicer to write: "while (--i >= 0) {"

  1018                  if (bgp->conf->sensors[i].unregister_cooling)
  1019                          bgp->conf->sensors[i].unregister_cooling(bgp, i);
  1020                  if (bgp->conf->remove_sensor)
  1021                          bgp->conf->remove_sensor(bgp, i);
  1022          }

regards,
dan carpenter
