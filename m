From: Joe Perches <joe@perches.com>
Date: Mon, 30 Mar 2020 17:52:09 +0000
Subject: Re: [PATCH][next] net: ethernet: ti: fix spelling mistake "rundom" -> "random"
Message-Id: <bfc2cff78325ad2845ef0c7ec2d7ba719fd4f1a1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200330101639.161268-1-colin.king@canonical.com>
In-Reply-To: <20200330101639.161268-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Grygorii Strashko <grygorii.strashko@ti.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2020-03-30 at 11:16 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err error message. Fix it.
[]
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
[]
> @@ -1627,7 +1627,7 @@ static int am65_cpsw_nuss_init_slave_ports(struct am65_cpsw_common *common)
>  							   port->slave.mac_addr) ||
>  			   !is_valid_ether_addr(port->slave.mac_addr)) {
>  			random_ether_addr(port->slave.mac_addr);
> -			dev_err(dev, "Use rundom MAC address\n");
> +			dev_err(dev, "Use random MAC address\n");

This continues without returning an error value.
Is this actually an error?

It might be useful to describe the slave and
random ethernet address too.

Perhaps:

			dev_notice(dev, "%pOF slave[%d] using random MAC address %pM\n",
				   port_np, port_id, port->slave.mac_addr);

or maybe dev_info
