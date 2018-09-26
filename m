From: David Miller <davem@davemloft.net>
Date: Wed, 26 Sep 2018 17:32:07 +0000
Subject: Re: [PATCH net-next] net: aquantia: Make function aq_fw1x_set_power() static
Message-Id: <20180926.103207.2106802198262360070.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537964400-179255-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1537964400-179255-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: igor.russkikh@aquantia.com, nikita.danilov@aquantia.com, yana.esina@aquantia.com, andrew@lunn.ch, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 26 Sep 2018 12:20:00 +0000

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c:873:5: warning:
>  symbol 'aq_fw1x_set_power' was not declared. Should it be static?
> 
> Fixes: a0da96c08cfa ("net: aquantia: implement WOL support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
