From: David Miller <davem@davemloft.net>
Date: Thu, 02 Jun 2011 07:10:59 +0000
Subject: Re: [PATCH 4/10] drivers/net/can/flexcan.c: add missing clk_put
Message-Id: <20110602.001059.183111215741236866.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1106012207260.5871@ask.diku.dk>
	<20110601.131136.391831410750786951.davem@davemloft.net>
	<Pine.LNX.4.64.1106020748020.22932@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1106020748020.22932@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: joe@perches.com, wg@grandegger.com, kernel-janitors@vger.kernel.org, socketcan-core@lists.berlios.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, wharms@bfs.de

From: Julia Lawall <julia@diku.dk>
Date: Thu, 2 Jun 2011 07:48:50 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> The failed_get label is used after the call to clk_get has succeeded, so it
> should be moved up above the call to clk_put.
> 
> The failed_req labels doesn't do anything different than failed_get, so
> delete it.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
