From: David Miller <davem@davemloft.net>
Date: Thu, 13 Aug 2009 04:19:29 +0000
Subject: Re: [PATCH 2/3] drivers/net: Correct use of
Message-Id: <20090812.211929.101928561.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908090943210.13271@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908090943210.13271@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 9 Aug 2009 09:43:42 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> request_mem_region should be used with release_mem_region, not request_region.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
