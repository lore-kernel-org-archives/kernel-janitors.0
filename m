From: Andrew Lunn <andrew@lunn.ch>
Date: Thu, 26 Sep 2019 13:24:58 +0000
Subject: Re: [PATCH net] net: axienet: fix a signedness bug in probe
Message-Id: <20190926132458.GC20927@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105911.GI3264@mwanda>
 <20190925110542.GA21923@salem.gmr.ssr.upm.es>
 <20190926131811.GG29696@kadam>
In-Reply-To: <20190926131811.GG29696@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Alvaro G. M" <alvaro.gamez@hazent.com>, Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>, "David S. Miller" <davem@davemloft.net>, Michal Simek <michal.simek@xilinx.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

> The get_phy_mode() function seem like they lend themselves to creating
> these bugs.  The ->phy_mode variables tend to be declared in the driver
> so it would require quite a few patches to make them all int and I'm not
> sure that's more beautiful.  Andrew Lunn's idea to update the API would
> probably be a good idea.

Hi Dan

I started on it. Once net-next has opened, and 0-day has compile
tested my changes, i will post the code for review.

       Andrew
