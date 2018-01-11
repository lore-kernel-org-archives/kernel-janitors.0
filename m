From: David Miller <davem@davemloft.net>
Date: Thu, 11 Jan 2018 18:55:26 +0000
Subject: Re: [PATCH net-next] net: socionext: Fix error return code in netsec_netdev_open()
Message-Id: <20180111.135526.903152562046487739.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1515669698-126382-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1515669698-126382-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jaswinder.singh@linaro.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 11 Jan 2018 11:21:38 +0000

> Fix to return error code -ENODEV from the of_phy_connect() error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 533dd11a12f6 ("net: socionext: Add Synquacer NetSec driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.
