From: David Miller <davem@davemloft.net>
Date: Thu, 05 Jul 2018 10:30:49 +0000
Subject: Re: [PATCH net-next] net: dsa: vsc73xx: Make some functions static
Message-Id: <20180705.193049.809877010632185787.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530781149-52681-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1530781149-52681-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, linus.walleij@linaro.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 5 Jul 2018 08:59:09 +0000

> Fixes the following sparse warnings:
> 
> drivers/net/dsa/vitesse-vsc73xx.c:1054:6: warning:
>  symbol 'vsc73xx_get_strings' was not declared. Should it be static?
> drivers/net/dsa/vitesse-vsc73xx.c:1113:5: warning:
>  symbol 'vsc73xx_get_sset_count' was not declared. Should it be static?
> drivers/net/dsa/vitesse-vsc73xx.c:1122:6: warning:
>  symbol 'vsc73xx_get_ethtool_stats' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
