From: David Miller <davem@davemloft.net>
Date: Fri, 19 Jul 2019 03:34:38 +0000
Subject: Re: [PATCH v2] ag71xx: fix error return code in ag71xx_probe()
Message-Id: <20190718.203438.2073335732713416227.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190717115215.22965-1-weiyongjun1@huawei.com>
        <20190719012157.100396-1-weiyongjun1@huawei.com>
In-Reply-To: <20190719012157.100396-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jcliburn@gmail.com, chris.snook@gmail.com, o.rempel@pengutronix.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 19 Jul 2019 01:21:57 +0000

> Fix to return error code -ENOMEM from the dmam_alloc_coherent() error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: d51b6ce441d3 ("net: ethernet: add ag71xx driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

Applied.
