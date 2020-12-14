From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Mon, 14 Dec 2020 22:54:38 +0000
Subject: Re: [PATCH] net: mscc: ocelot: Fix a resource leak in the error handling path of the probe function
Message-Id: <20201214225438.GY1781038@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201213114838.126922-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201213114838.126922-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: UNGLinuxDriver@microchip.com, vladimir.oltean@nxp.com, claudiu.manoil@nxp.com, davem@davemloft.net, kuba@kernel.org, andrew@lunn.ch, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 13/12/2020 12:48:38+0100, Christophe JAILLET wrote:
> In case of error after calling 'ocelot_init()', it must be undone by a
> corresponding 'ocelot_deinit()' call, as already done in the remove
> function.
> 
> Fixes: a556c76adc05 ("net: mscc: Add initial Ocelot switch support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/net/ethernet/mscc/ocelot_vsc7514.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mscc/ocelot_vsc7514.c b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
> index 1e7729421a82..9cf2bc5f4289 100644
> --- a/drivers/net/ethernet/mscc/ocelot_vsc7514.c
> +++ b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
> @@ -1267,7 +1267,7 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
>  
>  	err = mscc_ocelot_init_ports(pdev, ports);
>  	if (err)
> -		goto out_put_ports;
> +		goto out_ocelot_deinit;
>  
>  	if (ocelot->ptp) {
>  		err = ocelot_init_timestamp(ocelot, &ocelot_ptp_clock_info);
> @@ -1282,8 +1282,14 @@ static int mscc_ocelot_probe(struct platform_device *pdev)
>  	register_switchdev_notifier(&ocelot_switchdev_nb);
>  	register_switchdev_blocking_notifier(&ocelot_switchdev_blocking_nb);
>  
> +	of_node_put(ports);
> +
>  	dev_info(&pdev->dev, "Ocelot switch probed\n");
>  
> +	return 0;
> +
> +out_ocelot_deinit:
> +	ocelot_deinit(ocelot);
>  out_put_ports:
>  	of_node_put(ports);
>  	return err;
> -- 
> 2.27.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
