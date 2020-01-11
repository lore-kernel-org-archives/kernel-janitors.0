From: David Miller <davem@davemloft.net>
Date: Sat, 11 Jan 2020 07:15:55 +0000
Subject: Re: [PATCH net-next] sfc: remove set but not used variable 'nic_data'
Message-Id: <20200110.231555.1390807442365734004.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110060908.124241-1-yuehaibing@huawei.com>
In-Reply-To: <20200110060908.124241-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: amaftei@solarflare.com, ecree@solarflare.com, mhabets@solarflare.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, hulkci@huawei.com

From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 10 Jan 2020 06:09:08 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/sfc/mcdi_functions.c: In function 'efx_mcdi_ev_init':
> drivers/net/ethernet/sfc/mcdi_functions.c:79:28: warning:
>  variable 'nic_data' set but not used [-Wunused-but-set-variable]
> 
> commit 4438b587fe4b ("sfc: move MCDI event queue management code")
> introduces this unused variable.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
