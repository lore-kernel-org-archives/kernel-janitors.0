From: David Miller <davem@davemloft.net>
Date: Sun, 02 Aug 2009 19:55:45 +0000
Subject: Re: [PATCH 5/5] drivers/net: Use DIV_ROUND_CLOSEST
Message-Id: <20090802.125545.11631148.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908012150340.25693@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908012150340.25693@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sat, 1 Aug 2009 21:51:06 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
> but is perhaps more readable.

Applied.
