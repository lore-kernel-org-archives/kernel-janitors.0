From: David Miller <davem@davemloft.net>
Date: Tue, 24 Aug 2010 21:50:42 +0000
Subject: Re: [patch 1/4] pxa168_eth: remove unneeded null check
Message-Id: <20100824.145042.102566553.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100824165150.GH29330@bicker>
In-Reply-To: <20100824165150.GH29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: ssanap@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 18:52:46 +0200

> "pep->pd" isn't checked consistently in this function.  For example it's
> dereferenced unconditionally on the next line after the end of the if
> condition.  This function is only called from pxa168_eth_probe() and
> pep->pd is always non-NULL so I removed the check.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
