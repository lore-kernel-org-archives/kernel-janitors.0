From: David Miller <davem@davemloft.net>
Date: Thu, 25 Apr 2013 07:50:48 +0000
Subject: Re: [patch -next] net: calxedaxgmac: fix condition in xgmac_set_features()
Message-Id: <20130425.035048.266657036340116086.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130425074420.GA11880@elgon.mountain>
In-Reply-To: <20130425074420.GA11880@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: grant.likely@linaro.org, rob.herring@calxeda.com, edumazet@google.com, fabio.estevam@freescale.com, jiri@resnulli.us, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Apr 2013 10:44:20 +0300

> The "changed" variable should be a 64 bit type, otherwise it can't store
> all the features.  The way the code is now the test for whether
> NETIF_F_RXCSUM changed is always false and we return immediately.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
