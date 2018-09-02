From: David Miller <davem@davemloft.net>
Date: Sun, 02 Sep 2018 05:31:13 +0000
Subject: Re: [PATCH net-next] net: bgmac: remove set but not used variable 'err'
Message-Id: <20180901.223113.1797049678988828770.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535771590-158413-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535771590-158413-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: f.fainelli@gmail.com, andrew@lunn.ch, colin.king@canonical.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 1 Sep 2018 03:13:10 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/broadcom/bgmac.c: In function 'bgmac_dma_alloc':
> drivers/net/ethernet/broadcom/bgmac.c:619:6: warning:
>  variable 'err' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
