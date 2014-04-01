From: David Miller <davem@davemloft.net>
Date: Tue, 01 Apr 2014 20:23:22 +0000
Subject: Re: [patch 1/3] net: sxgbe: sxgbe_mdio_register() frees the bus
Message-Id: <20140401.162322.2243641448457002118.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140401133844.GA11536@mwanda>
In-Reply-To: <20140401133844.GA11536@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: bh74.an@samsung.com, ks.giri@samsung.com, siva.kallam@samsung.com, vipul.pandya@samsung.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 1 Apr 2014 16:38:44 +0300

> @@ -219,13 +219,6 @@ int sxgbe_mdio_register(struct net_device *ndev)
>  		}
>  	}
>  
> -	if (!err) {
> -		netdev_err(ndev, "PHY not found\n");
> -		mdiobus_unregister(mdio_bus);
> -		mdiobus_free(mdio_bus);
> -		goto mdiobus_err;
> -	}
> -
...
> @@ -93,9 +93,9 @@ static void sxgbe_core_set_umac_addr(void __iomem *ioaddr, unsigned char *addr,
>  {
>  	u32 high_word, low_word;
>  
> -	high_word = (addr[5] << 8) || (addr[4]);
> -	low_word = ((addr[3] << 24) || (addr[2] << 16) ||
> -		    (addr[1] << 8) || (addr[0]));
> +	high_word = (addr[5] << 8) | (addr[4]);
> +	low_word = (addr[3] << 24) | (addr[2] << 16) |
> +		   (addr[1] << 8) | (addr[0]);
>  	writel(high_word, ioaddr + SXGBE_CORE_ADD_HIGHOFFSET(reg_n));
>  	writel(low_word, ioaddr + SXGBE_CORE_ADD_LOWOFFSET(reg_n));
>  }

Nothing says "DRIVER NOT TESTED" like these two bugs.

The MDIO bus is always freed, and the MAC address is corrupted
into a boolean value before being programmed into the hardware.

Frankly, this kind of stuff is unacceptable.

I cannot see how this driver can function successfully with
these two errors, it looks simply impossible.

I'm not going to hide my feelings, this was a truly terrible driver
submission.  The amount of reviewing resources consumed during all
of these iterations was huge, and it still went in with bugs like
this.

It probably should have gone into staging.
