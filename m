From: David Miller <davem@davemloft.net>
Date: Tue, 03 Jun 2014 23:09:15 +0000
Subject: Re: [PATCH 2/2 v5] lpc_eth: Use resource_size instead of computation
Message-Id: <20140603.160915.450521382704524671.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140602113430.GA3823@lip6.fr>
	<20140603103254.GA20794@lip6.fr>
	<20140603104559.GA21087@lip6.fr>
In-Reply-To: <20140603104559.GA21087@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benoit.taine@lip6.fr
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Benoit Taine <benoit.taine@lip6.fr>
Date: Tue, 3 Jun 2014 12:45:59 +0200

> This issue was reported by coccicheck using the semantic patch 
> at scripts/coccinelle/api/resource_size.cocci
> 
> Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>

Applied, thanks.
