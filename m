From: David Miller <davem@davemloft.net>
Date: Sun, 17 Feb 2019 23:32:31 +0000
Subject: Re: [PATCH net-next] net: dsa: bcm_sf2: Remove set but not used variables 'v6_spec, v6_m_spec'
Message-Id: <20190217.153231.2303870907333639025.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190215023647.146445-1-yuehaibing@huawei.com>
In-Reply-To: <20190215023647.146445-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 15 Feb 2019 02:36:47 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/dsa/bcm_sf2_cfp.c: In function 'bcm_sf2_cfp_ipv6_rule_set':
> drivers/net/dsa/bcm_sf2_cfp.c:606:40: warning:
>  variable 'v6_m_spec' set but not used [-Wunused-but-set-variable]
> drivers/net/dsa/bcm_sf2_cfp.c:606:30: warning:
>  variable 'v6_spec' set but not used [-Wunused-but-set-variable]
> 
> It not used any more after commit e4f7ef54cbd8 ("dsa: bcm_sf2: use flow_rule
> infrastructure")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
