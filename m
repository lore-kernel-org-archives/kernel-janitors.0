From: David Miller <davem@davemloft.net>
Date: Wed, 18 Aug 2010 21:28:30 +0000
Subject: Re: [PATCH 13/16] net/ax25: Use available error codes
Message-Id: <20100818.142830.246516044.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008161828030.19313@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008161828030.19313@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: jreuter@yaina.de, ralf@linux-mips.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Mon, 16 Aug 2010 18:28:19 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> Error codes are stored in err, but the return value is always 0.  Return
> err instead.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
