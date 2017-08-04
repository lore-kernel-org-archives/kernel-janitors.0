From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 04 Aug 2017 17:48:49 +0000
Subject: Re: [PATCH] net: phy: marvell: logical vs bitwise OR typo
Message-Id: <20170804174849.GC3720@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170804081720.2g6yuthplhc4rv6b@mwanda>
 <063D6719AE5E284EB5DD2968C1650D6DD004B432@AcuExch.aculab.com>
In-Reply-To: <063D6719AE5E284EB5DD2968C1650D6DD004B432@AcuExch.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Dan Carpenter' <dan.carpenter@oracle.com>, Florian Fainelli <f.fainelli@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, Aug 04, 2017 at 02:54:45PM +0000, David Laight wrote:
> From: Dan Carpenter
> > Sent: 04 August 2017 09:17
> > This was supposed to be a bitwise OR but there is a || vs | typo.
> > 
> > Fixes: 864dc729d528 ("net: phy: marvell: Refactor m88e1121 RGMII delay configuration")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
> > index 361fe9927ef2..15cbcdba618a 100644
> > --- a/drivers/net/phy/marvell.c
> > +++ b/drivers/net/phy/marvell.c
> > @@ -83,7 +83,7 @@
> >  #define MII_88E1121_PHY_MSCR_REG	21
> >  #define MII_88E1121_PHY_MSCR_RX_DELAY	BIT(5)
> >  #define MII_88E1121_PHY_MSCR_TX_DELAY	BIT(4)
> > -#define MII_88E1121_PHY_MSCR_DELAY_MASK	(~(BIT(5) || BIT(4)))
> > +#define MII_88E1121_PHY_MSCR_DELAY_MASK	(~(BIT(5) | BIT(4)))
> 
> Wouldn't:
> +#define MII_88E1121_PHY_MSCR_DELAY_MASK	(~(MII_88E1121_PHY_MSCR_RX_DELAY | MII_88E1121_PHY_MSCR_TX_DELAY))
> be more correct?
> If a little long?
> Actually the ~ looks odd here....
> Reads code....
> Kill the define and explicitly mask off the two values just before
> conditionally setting them.

Hi David

I will put this on my TODO list. But lets get Dan's fix included
first.

	Andrew
