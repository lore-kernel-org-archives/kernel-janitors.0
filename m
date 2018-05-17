From: David Miller <davem@davemloft.net>
Date: Thu, 17 May 2018 20:28:07 +0000
Subject: Re: [PATCH] net/ncsi: prevent a couple array underflows
Message-Id: <20180517.162807.2024433602650608102.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180517123336.GB7655@mwanda>
In-Reply-To: <20180517123336.GB7655@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sam@mendozajonas.com, netdev@vger.kernel.org, gwshan@linux.vnet.ibm.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 May 2018 15:33:36 +0300

> We recently refactored this code and introduced a static checker
> warning.  Smatch complains that if cmd->index is zero then we would
> underflow the arrays.  That's obviously true.
> 
> The question is whether we prevent cmd->index from being zero at a
> different level.  I've looked at the code and I don't immediately see
> a check for that.
> 
> Fixes: 062b3e1b6d4f ("net/ncsi: Refactor MAC, VLAN filters")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks Dan.
