From: David Miller <davem@davemloft.net>
Date: Sun, 17 Feb 2019 23:52:06 +0000
Subject: Re: [PATCH net-next] net: sgi: use GFP_ATOMIC under spin lock
Message-Id: <20190217.155206.75010948411009821.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216014809.142801-1-weiyongjun1@huawei.com>
In-Reply-To: <20190216014809.142801-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: yang.wei9@zte.com.cn, mcgrof@kernel.org, yuehaibing@huawei.com, hch@lst.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 16 Feb 2019 01:48:09 +0000

> The function meth_init_tx_ring() is called from meth_tx_timeout(),
> in which spin_lock is held, so we should use GFP_ATOMIC instead.
> 
> Fixes: 8d4c28fbc284 ("meth: pass struct device to DMA API functions")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
