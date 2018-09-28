From: David Miller <davem@davemloft.net>
Date: Fri, 28 Sep 2018 17:15:22 +0000
Subject: Re: [PATCH net-next] qed: Remove set but not used variable 'p_archipelago'
Message-Id: <20180928.101522.2217227971770821719.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538030706-138186-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538030706-138186-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: Ariel.Elior@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 27 Sep 2018 06:45:06 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/qlogic/qed/qed_ooo.c: In function 'qed_ooo_delete_isles':
> drivers/net/ethernet/qlogic/qed/qed_ooo.c:354:30: warning:
>  variable 'p_archipelago' set but not used [-Wunused-but-set-variable]
>  
> drivers/net/ethernet/qlogic/qed/qed_ooo.c: In function 'qed_ooo_join_isles':
> drivers/net/ethernet/qlogic/qed/qed_ooo.c:463:30: warning:
>  variable 'p_archipelago' set but not used [-Wunused-but-set-variable]
> 
> Since commit 1eec2437d14c ("qed: Make OOO archipelagos into an array"),
> 'p_archipelago' is no longer in use.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks.
