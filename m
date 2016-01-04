From: Andrew Lunn <andrew@lunn.ch>
Date: Mon, 04 Jan 2016 21:20:02 +0000
Subject: Re: phy: micrel: Add ethtool statistics counters
Message-Id: <20160104212002.GD7485@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160104211545.GA9452@mwanda>
In-Reply-To: <20160104211545.GA9452@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jan 05, 2016 at 12:15:45AM +0300, Dan Carpenter wrote:
> Hello Andrew Lunn,
> 
> The patch 2b2427d06426: "phy: micrel: Add ethtool statistics
> counters" from Dec 30, 2015, leads to the following static checker
> warning:
> 
> 	drivers/net/phy/micrel.c:609 kszphy_get_stat()
> 	warn: unsigned 'val' is never less than zero.
> 
> drivers/net/phy/micrel.c
>    602  static u64 kszphy_get_stat(struct phy_device *phydev, int i)
>    603  {
>    604          struct kszphy_hw_stat stat = kszphy_hw_stats[i];
>    605          struct kszphy_priv *priv = phydev->priv;
>    606          u64 val;
>    607  
>    608          val = phy_read(phydev, stat.reg);
>    609          if (val < 0) {
>                     ^^^^^^^
> Unpossible!

Yep, will fix.

You might see the same from the Marvell phy driver...

    Andrew
