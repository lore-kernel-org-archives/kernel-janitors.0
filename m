From: David Miller <davem@davemloft.net>
Date: Tue, 06 Jul 2010 05:16:08 +0000
Subject: Re: [PATCH] drivers/net: correct valid flag
Message-Id: <20100705.221608.149821740.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1007051706530.15185@ask.diku.dk>
	<20100705.180349.112607097.davem@davemloft.net>
	<Pine.LNX.4.64.1007060711320.30668@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1007060711320.30668@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Tue, 6 Jul 2010 07:11:45 +0200 (CEST)

> From: Julia Lawall <julia@diku.dk>
> 
> Elsewhere in the "optimized" functions, the "2" constants are used.
> NV_TX_VALID and NV_TX2_VALID have the same value.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Since the two values are identical this doesn't fix a bug, so I've
applied this to net-next-2.6

Thanks!
