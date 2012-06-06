From: Raffaele Recalcati <raffaele.recalcati@bticino.it>
Date: Wed, 06 Jun 2012 17:03:11 +0000
Subject: Re: [patch] net/ethernet: ks8851_mll unregister_netdev() before freeing
Message-Id: <20120606170311.GB3382@recalcati>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120606063129.GA26829@elgon.mountain>
In-Reply-To: <20120606063129.GA26829@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09:31 Wed 06 Jun     , Dan Carpenter wrote:
> We added another error condition here, but if we were to hit it then
> we need to unregister_netdev() before doing the free_netdev().
> Otherwise we would hit the BUG_ON() in free_netdev():
> 
> 	BUG_ON(dev->reg_state != NETREG_UNREGISTERED);
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker stuff.  I don't have this hardware.
> 
> diff --git a/drivers/net/ethernet/micrel/ks8851_mll.c b/drivers/net/ethernet/micrel/ks8851_mll.c
> index 70bd329..875dd5e 100644
> --- a/drivers/net/ethernet/micrel/ks8851_mll.c
> +++ b/drivers/net/ethernet/micrel/ks8851_mll.c
> @@ -1606,7 +1606,7 @@ static int __devinit ks8851_probe(struct platform_device *pdev)
>  	if (!pdata) {
>  		netdev_err(netdev, "No platform data\n");
>  		err = -ENODEV;
> -		goto err_register;
> +		goto err_pdata;
>  	}
>  	memcpy(ks->mac_addr, pdata->mac_addr, 6);
>  	if (!is_valid_ether_addr(ks->mac_addr)) {
> @@ -1626,6 +1626,8 @@ static int __devinit ks8851_probe(struct platform_device *pdev)
>  		    (id >> 8) & 0xff, (id >> 4) & 0xf, (id >> 1) & 0x7);
>  	return 0;
>  
> +err_pdata:
> +	unregister_netdev(netdev);
>  err_register:
>  err_get_irq:
>  	iounmap(ks->hw_addr_cmd);

Tested-by: Raffaele Recalcati <raffaele.recalcati@bticino.it>

[    2.274993] ks8851_mll ks8851_mll: (unregistered net_device): message enable is 0
[    2.282897] ks8851_mll ks8851_mll: (unregistered net_device): the selftest passes
[    2.302246] ks8851_mll ks8851_mll: eth0: No platform data

