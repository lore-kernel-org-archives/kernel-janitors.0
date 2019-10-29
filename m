From: David Miller <davem@davemloft.net>
Date: Tue, 29 Oct 2019 23:44:18 +0000
Subject: Re: [PATCH net-next] ionic: Remove set but not used variable 'sg_desc'
Message-Id: <20191029.164418.1957595418522916270.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191028120121.20743-1-yuehaibing@huawei.com>
In-Reply-To: <20191028120121.20743-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: snelson@pensando.io, drivers@pensando.io, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 28 Oct 2019 12:01:21 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/pensando/ionic/ionic_txrx.c: In function 'ionic_rx_empty':
> drivers/net/ethernet/pensando/ionic/ionic_txrx.c:405:28: warning:
>  variable 'sg_desc' set but not used [-Wunused-but-set-variable]
> 
> It is never used, so can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
