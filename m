From: David Miller <davem@davemloft.net>
Date: Sun, 05 May 2019 17:47:33 +0000
Subject: Re: [PATCH net-next] net: mvpp2: cls: Remove set but not used variable 'act'
Message-Id: <20190505.104733.1706247040193919651.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190504040405.13004-1-yuehaibing@huawei.com>
In-Reply-To: <20190504040405.13004-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: maxime.chevallier@bootlin.com, antoine.tenart@bootlin.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 4 May 2019 04:04:05 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c: In function 'mvpp2_cls_c2_build_match':
> drivers/net/ethernet/marvell/mvpp2/mvpp2_cls.c:1159:28: warning:
>  variable 'act' set but not used [-Wunused-but-set-variable]
> 
> It is never used since introduction in
> commit 90b509b39ac9 ("net: mvpp2: cls: Add Classification offload support")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
