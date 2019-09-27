From: David Miller <davem@davemloft.net>
Date: Fri, 27 Sep 2019 08:02:10 +0000
Subject: Re: [PATCH net] net: hisilicon: Fix signedness bug in hix5hd2_dev_probe()
Message-Id: <20190927.100210.239358779936843638.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105532.GC3264@mwanda>
In-Reply-To: <20190925105532.GC3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: yisen.zhuang@huawei.com, zhangfei.gao@linaro.org, salil.mehta@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 13:55:32 +0300

> The "priv->phy_mode" variable is an enum and in this context GCC will
> treat it as unsigned to the error handling will never trigger.
> 
> Fixes: 57c5bc9ad7d7 ("net: hisilicon: add hix5hd2 mac driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
