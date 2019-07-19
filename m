From: David Miller <davem@davemloft.net>
Date: Fri, 19 Jul 2019 03:34:47 +0000
Subject: Re: [PATCH v2] ag71xx: fix return value check in ag71xx_probe()
Message-Id: <20190718.203447.802057574398577206.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190717115225.23047-1-weiyongjun1@huawei.com>
        <20190719012206.100478-1-weiyongjun1@huawei.com>
In-Reply-To: <20190719012206.100478-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jcliburn@gmail.com, chris.snook@gmail.com, o.rempel@pengutronix.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 19 Jul 2019 01:22:06 +0000

> In case of error, the function of_get_mac_address() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> Fixes: d51b6ce441d3 ("net: ethernet: add ag71xx driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied.
