From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 04 Aug 2017 17:46:59 +0000
Subject: Re: [PATCH] net: phy: marvell: logical vs bitwise OR typo
Message-Id: <20170804174659.GB3720@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170804081720.2g6yuthplhc4rv6b@mwanda>
In-Reply-To: <20170804081720.2g6yuthplhc4rv6b@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 04, 2017 at 11:17:21AM +0300, Dan Carpenter wrote:
> This was supposed to be a bitwise OR but there is a || vs | typo.
> 
> Fixes: 864dc729d528 ("net: phy: marvell: Refactor m88e1121 RGMII delay configuration")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hi Dan

Thanks for the fix.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
