From: David Miller <davem@davemloft.net>
Date: Fri, 27 Sep 2019 08:21:06 +0000
Subject: Re: [PATCH net] net: nixge: Fix a signedness bug in nixge_probe()
Message-Id: <20190927.102106.1025434748772068784.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925110524.GP3264@mwanda>
In-Reply-To: <20190925110524.GP3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: mdf@kernel.org, andrew@lunn.ch, alex.williams@ni.com, mcgrof@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 14:05:24 +0300

> The "priv->phy_mode" is an enum and in this context GCC will treat it
> as an unsigned int so it can never be less than zero.
> 
> Fixes: 492caffa8a1a ("net: ethernet: nixge: Add support for National Instruments XGE netdev")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
