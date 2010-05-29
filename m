From: David Miller <davem@davemloft.net>
Date: Sat, 29 May 2010 07:19:50 +0000
Subject: Re: [PATCH 4/17] drivers/isdn/hardware/mISDN: Add missing
Message-Id: <20100529.001950.71558279.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005261754560.23743@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005261754560.23743@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Wed, 26 May 2010 17:55:10 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> Add a spin_unlock missing on the error path.  The return value of write_reg
> seems to be completely ignored, so it seems that the lock should be
> released in every case.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks.
