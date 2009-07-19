From: Joe Perches <joe@perches.com>
Date: Sun, 19 Jul 2009 18:24:51 +0000
Subject: Re: [PATCH] drivers/net/mlx4: Adjust constant
Message-Id: <1248027891.31365.17.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907191809050.16542@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907191809050.16542@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2009-07-19 at 18:09 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The values in the advertising field are typically ADVERTISED_xxx, not
> SUPPORTED_xxx.  Both SUPPORTED_10000baseT_Full and
> ADVERTISED_1000baseT_Full have the same value.

other possibles:

drivers/net/sungem.c:#define ADVERTISE_MASK	(SUPPORTED_10baseT_Half | SUPPORTED_10baseT_Full | \
			 SUPPORTED_100baseT_Half | SUPPORTED_100baseT_Full | \
			 SUPPORTED_1000baseT_Half | SUPPORTED_1000baseT_Full | \
			 SUPPORTED_Pause | SUPPORTED_Autoneg)
drivers/net/s2io.c:	info->advertising = (SUPPORTED_10000baseT_Full | SUPPORTED_FIBRE);
drivers/net/spider_net.c:		advertise |= SUPPORTED_1000baseT_Full;
drivers/net/spider_net.c:		advertise |= SUPPORTED_1000baseT_Half;


