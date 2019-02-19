From: David Miller <davem@davemloft.net>
Date: Tue, 19 Feb 2019 00:48:02 +0000
Subject: Re: [PATCH net-next] bnx2x: Remove set but not used variable 'mfw_vn'
Message-Id: <20190218.164802.605932576907030600.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218121954.78928-1-yuehaibing@huawei.com>
In-Reply-To: <20190218121954.78928-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: aelior@marvell.com, skalluru@marvell.com, GR-everest-linux-l2@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 12:19:54 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c: In function 'bnx2x_get_hwinfo':
> drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:11940:10: warning:
>  variable 'mfw_vn' set but not used [-Wunused-but-set-variable]
> 
> It's never used since introduction.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
