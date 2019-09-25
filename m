From: Andrew Lunn <andrew@lunn.ch>
Date: Wed, 25 Sep 2019 12:14:06 +0000
Subject: Re: [PATCH net] net: axienet: fix a signedness bug in probe
Message-Id: <20190925121406.GA1864@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105911.GI3264@mwanda>
 <20190925110542.GA21923@salem.gmr.ssr.upm.es>
 <20190925.133507.2083224833639646147.davem@davemloft.net>
In-Reply-To: <20190925.133507.2083224833639646147.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: alvaro.gamez@hazent.com, dan.carpenter@oracle.com, radhey.shyam.pandey@xilinx.com, michal.simek@xilinx.com, linux@armlinux.org.uk, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 25, 2019 at 01:35:07PM +0200, David Miller wrote:
> From: "Alvaro G. M" <alvaro.gamez@hazent.com>
> Date: Wed, 25 Sep 2019 13:05:43 +0200
> 
> > Hi, Dan
> > 
> > On Wed, Sep 25, 2019 at 01:59:11PM +0300, Dan Carpenter wrote:
> >> The "lp->phy_mode" is an enum but in this context GCC treats it as an
> >> unsigned int so the error handling is never triggered.
> >> 
> >>  		lp->phy_mode = of_get_phy_mode(pdev->dev.of_node);
> >> -		if (lp->phy_mode < 0) {
> >> +		if ((int)lp->phy_mode < 0) {
> > 
> > This (almost) exact code appears in a lot of different drivers too,
> > so maybe it'd be nice to review them all and apply the same cast if needed?
> 
> Or make the thing an int if negative values are never valid 32-bit phy_mode
> values anyways.

Maybe we should change the API

int of_get_phy_mode(struct device_node *np, phy_interface_t *phy_mode);

Separate the error from the value we are getting.

	 Andrew
