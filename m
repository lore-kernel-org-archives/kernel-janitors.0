From: David Miller <davem@davemloft.net>
Date: Sun, 01 Aug 2010 07:32:39 +0000
Subject: Re: [PATCH] net/rose: Use GFP_ATOMIC
Message-Id: <20100801.003239.258116208.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1007311156180.6434@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1007311156180.6434@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: ralf@linux-mips.org, linux-hams@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sat, 31 Jul 2010 11:56:39 +0200 (CEST)

> The other calls to kmalloc in the same function use GFP_ATOMIC, and indeed
> two locks are held within the body of the function.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thank you!
