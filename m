From: David Miller <davem@davemloft.net>
Date: Thu, 06 Sep 2018 22:54:14 +0000
Subject: Re: [PATCH net-next] liquidio CN23XX: Remove set but not used variable 'ring_flag'
Message-Id: <20180906.155414.148086207999969031.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536232929-117243-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536232929-117243-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: derek.chickles@caviumnetworks.com, satananda.burla@caviumnetworks.com, felix.manlunas@caviumnetworks.com, raghu.vatsavayi@caviumnetworks.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 6 Sep 2018 11:22:09 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c: In function 'cn23xx_setup_octeon_vf_device':
> drivers/net/ethernet/cavium/liquidio/cn23xx_vf_device.c:619:20: warning:
>  variable 'ring_flag' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
