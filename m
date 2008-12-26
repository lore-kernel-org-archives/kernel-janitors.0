From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 08:14:47 +0000
Subject: Re: [PATCH 26/27] drivers/net/wireless/ipw2x00: fix sparse
Message-Id: <20081226.001447.234645995.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191851.11807.885.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191851.11807.885.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 20:18:51 +0100

> Fix this sparse warnings:
> 
>   drivers/net/wireless/ipw2x00/ipw2100.c:5271:6: warning: symbol 'ipw2100_queues_initialize' was not declared. Should it be static?
>   drivers/net/wireless/ipw2x00/ipw2100.c:5278:6: warning: symbol 'ipw2100_queues_free' was not declared. Should it be static?
>   drivers/net/wireless/ipw2x00/ipw2100.c:5285:5: warning: symbol 'ipw2100_queues_allocate' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
