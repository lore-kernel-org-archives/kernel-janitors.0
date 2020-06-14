From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Jun 2020 08:56:14 +0000
Subject: Re: [PATCH] net: macb: fix ref count leaking via pm_runtime_get_sync
Message-Id: <c145121b-3d69-a02a-17f5-f0eb2f166663@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, netdev@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, "David S. Miller" <davem@davemloft.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> in macb_mdio_write, …

* Will a desire evolve to improve also this commit message?

* Will the tag “Fixes” become helpful?


…
> +++ b/drivers/net/ethernet/cadence/macb_main.c
…
> @@ -3840,11 +3842,14 @@  static int at91ether_open(struct net_device *dev)
>
>  	ret = macb_phylink_connect(lp);
>  	if (ret)
> -		return ret;
> +		goto out;
>
>  	netif_start_queue(dev);
>
>  	return 0;
> +out:
> +	pm_runtime_put(&lp->pdev->dev);
> +	return ret;
>  }
…

Perhaps use the label “put_runtime” instead?

Regards,
Markus
