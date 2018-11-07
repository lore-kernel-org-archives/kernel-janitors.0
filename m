From: David Miller <davem@davemloft.net>
Date: Wed, 07 Nov 2018 19:46:59 +0000
Subject: Re: [PATCH net-next] net: hns3: Remove set but not used variable 'reset_level'
Message-Id: <20181107.114659.1188865327587221643.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541558033-100068-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541558033-100068-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, shiju.jose@huawei.com, colin.king@canonical.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 7 Nov 2018 02:33:53 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c: In function 'hclge_log_and_clear_ppp_error':
> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c:821:24: warning:
>  variable 'reset_level' set but not used [-Wunused-but-set-variable]
>   enum hnae3_reset_type reset_level = HNAE3_NONE_RESET;
> 
> It never used since introduction in commit
> 01865a50d78f ("net: hns3: Add enable and process hw errors of TM scheduler")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
