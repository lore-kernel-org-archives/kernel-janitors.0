From: David Miller <davem@davemloft.net>
Date: Wed, 24 Jan 2018 21:58:35 +0000
Subject: Re: [PATCH net-next] cxgb4: make symbol pedits static
Message-Id: <20180124.165835.176949720991377727.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516760073-129333-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516760073-129333-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: ganeshgr@chelsio.com, kumaras@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 24 Jan 2018 02:14:33 +0000

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.c:46:27: warning:
>  symbol 'pedits' was not declared. Should it be static?
> 
> Fixes: 27ece1f357b7 ("cxgb4: add tc flower support for ETH-DMAC rewrite")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.
