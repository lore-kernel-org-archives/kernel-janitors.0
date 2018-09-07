From: David Miller <davem@davemloft.net>
Date: Fri, 07 Sep 2018 04:55:25 +0000
Subject: Re: [PATCH net-next] bnxt_en: remove set but not used variable 'addr_type'
Message-Id: <20180906.215525.1228410994313718743.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536147850-186781-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536147850-186781-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: michael.chan@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 5 Sep 2018 11:44:10 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c: In function 'bnxt_tc_parse_flow':
> drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:186:6: warning:
>  variable 'addr_type' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Looks correct to me.

Applied, thanks.
