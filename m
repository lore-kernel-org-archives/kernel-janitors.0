From: David Miller <davem@davemloft.net>
Date: Fri, 06 Sep 2019 13:05:24 +0000
Subject: Re: [PATCH v2 net] net: sonic: return NETDEV_TX_OK if failed to map buffer
Message-Id: <20190906.150524.1245097015817848153.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <960c7d1f-6e80-84fb-8d7a-9c5692605500@huawei.com>
        <20190905015712.107173-1-maowenan@huawei.com>
In-Reply-To: <20190905015712.107173-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: eric.dumazet@gmail.com, tsbogend@alpha.franken.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Thu, 5 Sep 2019 09:57:12 +0800

> NETDEV_TX_BUSY really should only be used by drivers that call
> netif_tx_stop_queue() at the wrong moment. If dma_map_single() is
> failed to map tx DMA buffer, it might trigger an infinite loop.
> This patch use NETDEV_TX_OK instead of NETDEV_TX_BUSY, and change
> printk to pr_err_ratelimited.
> 
> Fixes: d9fb9f384292 ("*sonic/natsemi/ns83829: Move the National Semi-conductor drivers")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied.
