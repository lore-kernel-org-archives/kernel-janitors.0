From: David Miller <davem@davemloft.net>
Date: Wed, 25 Aug 2010 23:37:46 +0000
Subject: Re: [PATCH 1/5] drivers/net/irda: Eliminate memory leak
Message-Id: <20100825.163746.15256125.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008241638130.15172@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008241638130.15172@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: samuel@sortiz.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Tue, 24 Aug 2010 16:38:33 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> dev_alloc_skb allocates some memory, so that memory should be freed before
> leaving the function in an error case.
> 
> Corrected some typos in a nearby comment as well.
> 
> A simplified version of the semantic match that finds this problem is:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
