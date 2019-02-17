From: David Miller <davem@davemloft.net>
Date: Sun, 17 Feb 2019 23:55:52 +0000
Subject: Re: [PATCH net-next] net: hns3: make function hclge_set_all_vf_rst() static
Message-Id: <20190217.155552.1131617512362422475.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216081552.91298-1-weiyongjun1@huawei.com>
In-Reply-To: <20190216081552.91298-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, tanhuazhong@huawei.com, linyunsheng@huawei.com, lipeng321@huawei.com, shenjian15@huawei.com, liangfuyun1@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 16 Feb 2019 08:15:52 +0000

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:2431:5: warning:
>  symbol 'hclge_set_all_vf_rst' was not declared. Should it be static?
> 
> Fixes: aa5c4f175be6 ("net: hns3: add reset handling for VF when doing PF reset")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.
