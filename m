From: David Miller <davem@davemloft.net>
Date: Wed, 25 Jul 2018 23:38:20 +0000
Subject: Re: [PATCH net-next] lan743x: Make symbol lan743x_pm_ops static
Message-Id: <20180725.163820.956886787486240435.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532499076-191548-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1532499076-191548-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: bryan.whitehead@microchip.com, UNGLinuxDriver@microchip.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 25 Jul 2018 06:11:16 +0000

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/microchip/lan743x_main.c:2944:25: warning:
>  symbol 'lan743x_pm_ops' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
