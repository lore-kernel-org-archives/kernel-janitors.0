From: David Miller <davem@davemloft.net>
Date: Fri, 11 Sep 2009 19:13:31 +0000
Subject: Re: [PATCH 4/8] drivers/net/wan: introduce missing kfree
Message-Id: <20090911.121331.60080960.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0909111821360.10552@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0909111821360.10552@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: khc@pm.waw.pl, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Fri, 11 Sep 2009 18:21:51 +0200 (CEST)

> Error handling code following a kmalloc should free the allocated data.
> 
> The semantic match that finds the problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
