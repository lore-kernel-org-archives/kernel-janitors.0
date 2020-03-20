From: David Miller <davem@davemloft.net>
Date: Fri, 20 Mar 2020 04:00:26 +0000
Subject: Re: [PATCH net-next] liquidio: remove set but not used variable 's'
Message-Id: <20200319.210026.1097328564068541611.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200306023254.61731-1-yuehaibing@huawei.com>
        <20200319120743.28056-1-yuehaibing@huawei.com>
In-Reply-To: <20200319120743.28056-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: dchickles@marvell.com, leonro@mellanox.com, sburla@marvell.com, fmanlunas@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, hulkci@huawei.com

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 19 Mar 2020 12:07:43 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/cavium/liquidio/lio_main.c: In function 'octeon_chip_specific_setup':
> drivers/net/ethernet/cavium/liquidio/lio_main.c:1378:8: warning:
>  variable 's' set but not used [-Wunused-but-set-variable]
> 
> It's not used since commit b6334be64d6f ("net/liquidio: Delete driver version assignment")
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
