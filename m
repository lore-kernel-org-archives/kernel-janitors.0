From: David Miller <davem@davemloft.net>
Date: Mon, 14 Dec 2009 03:57:56 +0000
Subject: Re: [PATCH] drivers/net/cpmac.c: Correct code taking the size of a
Message-Id: <20091213.195756.102569162.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912131635110.27767@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912131635110.27767@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: florian@openwrt.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 13 Dec 2009 16:35:45 +0100 (CET)

> From: Julia Lawall <julia@diku.dk>
> 
> sizeof(dev->dev_addr) is the size of a pointer.  On the other hand,
> sizeof(pdata->dev_addr) is the size of an array, so use that instead.
> 
> A simplified version of the semantic patch that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
