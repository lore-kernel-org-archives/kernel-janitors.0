From: Francois Romieu <romieu@fr.zoreil.com>
Date: Sun, 15 Sep 2019 23:06:40 +0000
Subject: Re: [PATCH] net/wan: dscc4: remove broken dscc4 driver
Message-Id: <20190915230640.GA7382@electric-eye.fr.zoreil.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190913132817.GA13179@mwanda>
In-Reply-To: <20190913132817.GA13179@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> :
> Using static analysis, I discovered that the "dpriv->pci_priv->pdev"
> pointer is always NULL.  This pointer was supposed to be initialized
> during probe and is essential for the driver to work.  It would be easy
> to add a "ppriv->pdev = pdev;" to dscc4_found1() but this driver has
> been broken since before we started using git and no one has complained
> so probably we should just remove it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Francois Romieu <romieu@fr.zoreil.com>

-- 
Ueimor
