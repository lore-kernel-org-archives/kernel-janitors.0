From: David Miller <davem@davemloft.net>
Date: Mon, 14 Dec 2009 03:57:19 +0000
Subject: Re: [PATCH 2/9] drivers/atm: Correct code taking the size of a
Message-Id: <20091213.195719.246515608.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912131240400.24267@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912131240400.24267@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: chas@cmf.nrl.navy.mil, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 13 Dec 2009 12:40:55 +0100 (CET)

> From: Julia Lawall <julia@diku.dk>
> 
> sizeof(TstSchedTbl) is just the size of the pointer.  Change it to the size
> of the referenced data.
> 
> A simplified version of the semantic patch that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
