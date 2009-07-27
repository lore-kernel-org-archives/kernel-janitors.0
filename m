From: David Miller <davem@davemloft.net>
Date: Mon, 27 Jul 2009 18:36:01 +0000
Subject: Re: [PATCH 4/12] drivers/net: Correct redundant test
Message-Id: <20090727.113601.155824883.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907271813120.2682@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907271813120.2682@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Mon, 27 Jul 2009 18:13:30 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> res has already been tested.  It seems that this test should be on the
> recently returned value mmio.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://www.emn.fr/x-info/coccinelle/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied to net-next-2.6
