From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 08:12:14 +0000
Subject: Re: [PATCH 22/27] drivers/net/wan/z85230.c: fix sparse warnings:
Message-Id: <20081226.001214.02292973.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191813.11807.144.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191813.11807.144.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 20:18:13 +0100

> The symbols are only references within the translation unit they are
> defined in, so un-EXPORT them und make them 'static'.
> 
> Fix this sparse warnings:
> 
>   drivers/net/wan/z85230.c:604:25: warning: symbol 'z8530_dma_sync' was not declared. Should it be static?
>   drivers/net/wan/z85230.c:613:25: warning: symbol 'z8530_txdma_sync' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
