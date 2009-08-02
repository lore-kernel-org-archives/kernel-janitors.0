From: David Miller <davem@davemloft.net>
Date: Sun, 02 Aug 2009 19:55:52 +0000
Subject: Re: [PATCH 12/15] drivers/atm: Use DIV_ROUND_CLOSEST
Message-Id: <20090802.125552.192054201.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908021048280.15557@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908021048280.15557@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: chas@cmf.nrl.navy.mil, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 2 Aug 2009 10:48:45 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
> but is perhaps more readable.

Applied.
