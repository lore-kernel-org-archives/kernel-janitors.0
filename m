From: David Miller <davem@davemloft.net>
Date: Thu, 20 Sep 2018 06:10:29 +0000
Subject: Re: [PATCH net-next] atl1: remove set but not used variable 'advertising'
Message-Id: <20180919.231029.1752354474729594132.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537411290-5132-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537411290-5132-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: jcliburn@gmail.com, chris.snook@gmail.com, keescook@chromium.org, zhongjiang@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 20 Sep 2018 02:41:30 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/atheros/atlx/atl1.c: In function 'atl1_set_link_ksettings':
> drivers/net/ethernet/atheros/atlx/atl1.c:3280:6: warning:
>  variable 'advertising' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
