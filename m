From: David Miller <davem@davemloft.net>
Date: Mon, 17 Sep 2018 15:07:30 +0000
Subject: Re: [PATCH net-next] net: hns: make function hns_gmac_wait_fifo_clean() static
Message-Id: <20180917.080730.826411751996330525.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536975729-187303-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1536975729-187303-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, lipeng321@huawei.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 15 Sep 2018 01:42:09 +0000

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/hisilicon/hns/hns_dsaf_gmac.c:322:5: warning:
>  symbol 'hns_gmac_wait_fifo_clean' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
