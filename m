From: David Miller <davem@davemloft.net>
Date: Mon, 08 Oct 2018 18:04:26 +0000
Subject: Re: [PATCH net-next] net: mscc: ocelot: remove set but not used variable 'phy_mode'
Message-Id: <20181008.110426.490149828698716497.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539007670-82488-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539007670-82488-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: alexandre.belloni@bootlin.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 8 Oct 2018 14:07:50 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/mscc/ocelot_board.c: In function 'mscc_ocelot_probe':
> drivers/net/ethernet/mscc/ocelot_board.c:262:17: warning:
>  variable 'phy_mode' set but not used [-Wunused-but-set-variable]
>    enum phy_mode phy_mode;
> 
> It never used since introduction in 
> commit 71e32a20cfbf ("net: mscc: ocelot: make use of SerDes PHYs for handling their configuration")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
