From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Fri, 01 May 2020 18:37:03 +0000
Subject: Re: [PATCH] net: dsa: sja1105: fix speed setting for 10 MBPS
Message-Id: <20200501183703.GS1551@shell.armlinux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200501134310.289561-1-colin.king@canonical.com>
 <9018be0b7dc441cd8aad625c6cc44e1c@bfs.de>
In-Reply-To: <9018be0b7dc441cd8aad625c6cc44e1c@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Colin King <colin.king@canonical.com>, Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

On Fri, May 01, 2020 at 06:00:52PM +0000, Walter Harms wrote:
> IMHO it would be better to use switch case here to improve readability.
> 
> switch (bmcr & mask) {
> 
> case  BMCR_SPEED1000:
>                                  speed = SPEED_1000;
>                                  break;
> case  BMCR_SPEED100:
>                                  speed = SPEED_100;
>                                  break;
> case  BMCR_SPEED10:
>                                  speed = SPEED_10;
>                                  break;
> default:
>                                 speed = SPEED_UNKNOWN
> }
> 
> jm2c,
>  wh
> 
> btw: an_enabled ? why not !enabled, mich more easy to read

You misinterpret "an_enabled".  It's not "negated enabled".  It's not
even "disabled".  It's short for "autonegotiation enabled".  It's
positive logic too.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
