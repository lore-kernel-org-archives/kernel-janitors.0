From: David Miller <davem@davemloft.net>
Date: Tue, 16 Dec 2008 23:43:43 +0000
Subject: Re: [PATCH 6/11] drivers/net/hamradio: Move a dereference below a
Message-Id: <20081216.154343.142632693.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812161613320.20444@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812161613320.20444@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: jgarzik@pobox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Tue, 16 Dec 2008 16:13:50 +0100 (CET)

> In each case, if the NULL test is necessary, then the dereference should be
> moved below the NULL test.
> 
> The semantic patch that makes this change is as follows:
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied to net-next-2.6

