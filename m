From: David Miller <davem@davemloft.net>
Date: Fri, 27 Sep 2019 08:17:53 +0000
Subject: Re: [PATCH net] net: axienet: fix a signedness bug in probe
Message-Id: <20190927.101753.1158854931167184949.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105911.GI3264@mwanda>
In-Reply-To: <20190925105911.GI3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: radhey.shyam.pandey@xilinx.com, alvaro.gamez@hazent.com, michal.simek@xilinx.com, linux@armlinux.org.uk, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 13:59:11 +0300

> The "lp->phy_mode" is an enum but in this context GCC treats it as an
> unsigned int so the error handling is never triggered.
> 
> Fixes: ee06b1728b95 ("net: axienet: add support for standard phy-mode binding")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
