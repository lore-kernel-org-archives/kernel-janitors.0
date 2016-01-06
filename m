From: David Miller <davem@davemloft.net>
Date: Wed, 06 Jan 2016 20:28:41 +0000
Subject: Re: [patch -next] fsl/fman: double free on probe failure
Message-Id: <20160106.152841.1995536779811312340.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160106095910.GD23185@mwanda>
In-Reply-To: <20160106095910.GD23185@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: igal.liberman@freescale.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 6 Jan 2016 12:59:10 +0300

> "priv" is allocated with devm_kzalloc() so freeing it here with kfree()
> will lead to a double free.
> 
> Fixes: 3933961682a3 ('fsl/fman: Add FMan MAC driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
