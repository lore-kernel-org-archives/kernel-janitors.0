From: David Miller <davem@davemloft.net>
Date: Sun, 05 May 2019 17:17:48 +0000
Subject: Re: [PATCH net-next] drivers: net: davinci_mdio: fix return value check in davinci_mdio_probe()
Message-Id: <20190505.101748.916918403855488072.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503111859.1023-1-weiyongjun1@huawei.com>
In-Reply-To: <20190503111859.1023-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: grygorii.strashko@ti.com, f.fainelli@gmail.com, arnd@arndb.de, andrew@lunn.ch, nsekhar@ti.com, fugang.duan@nxp.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 3 May 2019 11:18:59 +0000

> In case of error, the function devm_ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: 03f66f067560 ("net: ethernet: ti: davinci_mdio: use devm_ioremap()")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
