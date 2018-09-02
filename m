From: David Miller <davem@davemloft.net>
Date: Sun, 02 Sep 2018 05:25:12 +0000
Subject: Re: [PATCH v2 net-next] liquidio: remove set but not used variable 'irh'
Message-Id: <20180901.222512.2096738565430886497.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535716436-87194-1-git-send-email-yuehaibing@huawei.com>
        <1535717036-88514-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535717036-88514-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: derek.chickles@caviumnetworks.com, satananda.burla@caviumnetworks.com, felix.manlunas@caviumnetworks.com, raghu.vatsavayi@caviumnetworks.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 31 Aug 2018 12:03:56 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/cavium/liquidio/request_manager.c: In function 'lio_process_iq_request_list':
> drivers/net/ethernet/cavium/liquidio/request_manager.c:383:27: warning:
>  variable 'irh' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v2: fix patch description,remove 'cHECK-'

Applied, thanks.
