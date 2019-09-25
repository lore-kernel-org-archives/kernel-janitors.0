From: "Alvaro G. M" <alvaro.gamez@hazent.com>
Date: Wed, 25 Sep 2019 11:05:43 +0000
Subject: Re: [PATCH net] net: axienet: fix a signedness bug in probe
Message-Id: <20190925110542.GA21923@salem.gmr.ssr.upm.es>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105911.GI3264@mwanda>
In-Reply-To: <20190925105911.GI3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>, "David S. Miller" <davem@davemloft.net>, Michal Simek <michal.simek@xilinx.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi, Dan

On Wed, Sep 25, 2019 at 01:59:11PM +0300, Dan Carpenter wrote:
> The "lp->phy_mode" is an enum but in this context GCC treats it as an
> unsigned int so the error handling is never triggered.
> 
>  		lp->phy_mode = of_get_phy_mode(pdev->dev.of_node);
> -		if (lp->phy_mode < 0) {
> +		if ((int)lp->phy_mode < 0) {

This (almost) exact code appears in a lot of different drivers too,
so maybe it'd be nice to review them all and apply the same cast if needed?

Best regards

-- 
Alvaro G. M.
