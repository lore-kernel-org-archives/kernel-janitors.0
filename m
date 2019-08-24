From: David Miller <davem@davemloft.net>
Date: Sat, 24 Aug 2019 21:22:31 +0000
Subject: Re: [PATCH net-next] cirrus: cs89x0: remove set but not used variable 'lp'
Message-Id: <20190824.142231.372281128687703445.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822063517.71231-1-yuehaibing@huawei.com>
In-Reply-To: <20190822063517.71231-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, hulkci@huawei.com

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 22 Aug 2019 06:35:17 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/cirrus/cs89x0.c: In function 'cs89x0_platform_probe':
> drivers/net/ethernet/cirrus/cs89x0.c:1847:20: warning:
>  variable 'lp' set but not used [-Wunused-but-set-variable]
> 
> It is not used since commit 6751edeb8700 ("cirrus: cs89x0: Use
> managed interfaces")

Please use a proper Fixes: tag.
