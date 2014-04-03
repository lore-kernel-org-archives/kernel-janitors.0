From: David Miller <davem@davemloft.net>
Date: Thu, 03 Apr 2014 18:54:22 +0000
Subject: Re: [PATCH net-next 1/1] sxgbe: fix driver probe error path and driver removal leaks
Message-Id: <20140403.145422.2017892921202259639.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140402231343.GC5013@electric-eye.fr.zoreil.com>
In-Reply-To: <20140402231343.GC5013@electric-eye.fr.zoreil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: romieu@fr.zoreil.com
Cc: bh74.an@samsung.com, dan.carpenter@oracle.com, ks.giri@samsung.com, siva.kallam@samsung.com, vipul.pandya@samsung.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Francois Romieu <romieu@fr.zoreil.com>
Date: Thu, 3 Apr 2014 01:13:43 +0200

> sxgbe_drv_probe:  mdio and priv->hw leaks
> sxgbe_drv_remove: clk and priv->hw leaks
> 
> Signed-off-by: Francois Romieu <romieu@fr.zoreil.com>

Also applied, thanks Francois.
