From: David Miller <davem@davemloft.net>
Date: Tue, 01 Apr 2014 20:27:44 +0000
Subject: Re: [patch 3/3] net: sxgbe: make "core_ops" static
Message-Id: <20140401.162744.185225542622478942.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140401133918.GA11087@mwanda>
In-Reply-To: <20140401133918.GA11087@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: bh74.an@samsung.com, ks.giri@samsung.com, siva.kallam@samsung.com, vipul.pandya@samsung.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 1 Apr 2014 16:39:18 +0300

> The "core_ops" variable isn't referenced outside this file and Sparse
> complains about it:
> 
> 	drivers/net/ethernet/samsung/sxgbe/sxgbe_core.c:239:29: warning:
> 	symbol 'core_ops' was not declared. Should it be static?
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
