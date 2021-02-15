From: David Miller <davem@davemloft.net>
Date: Mon, 15 Feb 2021 20:57:33 +0000
Subject: Re: [PATCH net-next] octeontx2-pf: fix an off by one bug in otx2_get_fecparam()
Message-Id: <20210215.125733.311587463365048945.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YCqZvjAzSmJk5Ftb@mwanda>
In-Reply-To: <YCqZvjAzSmJk5Ftb@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sgoutham@marvell.com, cjacob@marvell.com, gakula@marvell.com, sbhatta@marvell.com, hkelam@marvell.com, kuba@kernel.org, jesse.brandeburg@intel.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Feb 2021 18:56:46 +0300

> The "<= FEC_MAX_INDEX" comparison should be "< FEC_MAX_INDEX".
> 
> I did some cleanup in this function to hopefully make the code a bit
> clearer.  There was no blank line after the declaration block.  The
> closing curly brace on the fec[] declaration normally goes on a line
> by itself.  And I removed the FEC_MAX_INDEX define and used
> ARRAY_SIZE(fec) instead.
> 
> Fixes: d0cf9503e908 ("octeontx2-pf: ethtool fec mode support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This doesn't apply to net-next.
