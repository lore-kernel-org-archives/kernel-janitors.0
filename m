From: David Miller <davem@davemloft.net>
Date: Tue, 07 Jul 2009 02:10:11 +0000
Subject: Re: [PATCH] drivers/net/cs89x0.c: Avoid using magic number in
Message-Id: <20090706.191011.38865597.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907050922570.27464@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907050922570.27464@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 5 Jul 2009 09:23:21 +0200 (CEST)

> The constant DMA_RX_MODE is defined to be 0x14 in the local include file
> cs89x0.h.  Since a constant with the same name is used elsewhere with
> set_dma_mode, it seems likely that this constant could be used here.
> 
> The semantic match that finds this problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied to net-next-2.6, thanks!
