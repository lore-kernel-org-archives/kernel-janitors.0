From: David Miller <davem@davemloft.net>
Date: Mon, 17 Aug 2015 19:23:37 +0000
Subject: Re: [patch] net: ethernet: micrel: fix an error code
Message-Id: <20150817.122337.357015158066421245.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150814085459.GC30728@mwanda>
In-Reply-To: <20150814085459.GC30728@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: vinod.koul@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Aug 2015 11:54:59 +0300

> The dma_mapping_error() function returns true or false.  We should
> return -ENOMEM if it there is a dma mapping error.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
