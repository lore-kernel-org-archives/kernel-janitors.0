From: David Miller <davem@davemloft.net>
Date: Tue, 01 Apr 2014 20:27:34 +0000
Subject: Re: [patch 1/3] net: sxgbe: sxgbe_mdio_register() frees the bus
Message-Id: <20140401.162734.504976144664134433.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140401133844.GA11536@mwanda>
In-Reply-To: <20140401133844.GA11536@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: bh74.an@samsung.com, ks.giri@samsung.com, siva.kallam@samsung.com, vipul.pandya@samsung.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 1 Apr 2014 16:38:44 +0300

> "err" is always zero at this point so we always unregister and free the
> mdio_bus before returning success.  This seems like left over code and
> I have deleted it.
> 
> Fixes: 1edb9ca69e8a ('net: sxgbe: add basic framework for Samsung 10Gb ethernet driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
