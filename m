From: David Miller <davem@davemloft.net>
Date: Tue, 18 May 2010 05:55:55 +0000
Subject: Re: [PATCH 15/20] drivers/net: Use kcalloc or kzalloc
Message-Id: <20100517.225555.267953461.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005132205420.6282@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005132205420.6282@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Thu, 13 May 2010 22:06:01 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> Use kcalloc or kzalloc rather than the combination of kmalloc and memset.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
