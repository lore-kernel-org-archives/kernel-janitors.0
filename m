From: David Miller <davem@davemloft.net>
Date: Thu, 20 Apr 2017 20:25:47 +0000
Subject: Re: [PATCH net-next] qede: allocate enough data for ->arfs_fltr_bmap
Message-Id: <20170420.162547.1676158647736779786.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170419095432.GA4266@mwanda>
In-Reply-To: <20170419095432.GA4266@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Yuval.Mintz@cavium.com, Chopra@mwanda, Manish.Chopra@cavium.com, Ariel.Elior@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Apr 2017 12:54:33 +0300

> We've got the number of longs, yes, but we should multiply by
> sizeof(long) to get the number of bytes needed.
> 
> Fixes: e4917d46a653 ("qede: Add aRFS support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
