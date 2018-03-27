From: David Miller <davem@davemloft.net>
Date: Tue, 27 Mar 2018 14:50:41 +0000
Subject: Re: [PATCH net-next] net: aquantia: Make function hw_atl_utils_mpi_set_speed() static
Message-Id: <20180327.105041.491913783483076370.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522074747-22610-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522074747-22610-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: igor.russkikh@aquantia.com, pavel.belous@aquantia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 26 Mar 2018 14:32:27 +0000

> Fixes the following sparse warning:
> 
> drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c:508:5: warning:
>  symbol 'hw_atl_utils_mpi_set_speed' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
