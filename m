From: David Miller <davem@davemloft.net>
Date: Thu, 05 Jul 2018 10:30:57 +0000
Subject: Re: [PATCH net-next] net: aquantia: Make some functions static
Message-Id: <20180705.193057.524474932003989041.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530781210-54589-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1530781210-54589-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: igor.russkikh@aquantia.com, pavel.belous@aquantia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 5 Jul 2018 09:00:10 +0000

> Fixes the following sparse warnings:
> 
> drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c:525:5: warning:
>  symbol 'hw_atl_utils_mpi_set_speed' was not declared. Should it be static?
> drivers/net/ethernet/aquantia/atlantic/hw_atl/hw_atl_utils.c:536:5: warning:
>  symbol 'hw_atl_utils_mpi_set_state' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
