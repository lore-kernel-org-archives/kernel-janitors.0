From: Andrew Lunn <andrew@lunn.ch>
Date: Mon, 12 Nov 2018 02:17:50 +0000
Subject: Re: [PATCH net-next] net: phy: marvell: remove set but not used variable 'pause'
Message-Id: <20181112021750.GC23571@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541987250-18687-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541987250-18687-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Nov 12, 2018 at 01:47:30AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/phy/marvell.c: In function 'm88e1510_config_init':
> drivers/net/phy/marvell.c:850:7: warning:
>  variable 'pause' set but not used [-Wunused-but-set-variable]
> 
> It not used any more after commit 3c1bcc8614db ("net: ethernet: Convert phydev
> advertize and supported from u32 to link mode")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
