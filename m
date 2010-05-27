From: David Miller <davem@davemloft.net>
Date: Thu, 27 May 2010 23:30:16 +0000
Subject: Re: [PATCH 6/11] drivers/net: Eliminate a NULL pointer dereference
Message-Id: <20100527.163016.48525549.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005271433180.5422@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005271433180.5422@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Thu, 27 May 2010 14:33:32 +0200 (CEST)

> At the point of the print, dev is NULL.
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks.
