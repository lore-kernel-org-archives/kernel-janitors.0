From: David Miller <davem@davemloft.net>
Date: Fri, 09 Nov 2018 00:22:01 +0000
Subject: Re: [PATCH net-next] net: bcmgenet: return correct value 'ret' from bcmgenet_power_down
Message-Id: <20181108.162201.360454923619072769.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541642923-81463-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541642923-81463-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: opendmb@gmail.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 8 Nov 2018 02:08:43 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/broadcom/genet/bcmgenet.c: In function 'bcmgenet_power_down':
> drivers/net/ethernet/broadcom/genet/bcmgenet.c:1136:6: warning:
>  variable 'ret' set but not used [-Wunused-but-set-variable]
> 
> bcmgenet_power_down should return 'ret' instead of 0.
> 
> Fixes: ca8cf341903f ("net: bcmgenet: propagate errors from bcmgenet_power_down")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
