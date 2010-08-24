From: David Miller <davem@davemloft.net>
Date: Tue, 24 Aug 2010 21:51:03 +0000
Subject: Re: [patch 4/4] pxa168_eth: silence gcc warnings
Message-Id: <20100824.145103.70214095.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100824165505.GK29330@bicker>
In-Reply-To: <20100824165505.GK29330@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: ssanap@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Tue, 24 Aug 2010 18:55:05 +0200

> Casting "pep->tx_desc_dma" to to a struct tx_desc pointer makes gcc
> complain:
> 
> drivers/net/pxa168_eth.c:657: warning:
> 	cast to pointer from integer of different size
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
