From: David Miller <davem@davemloft.net>
Date: Tue, 04 Feb 2020 08:33:54 +0000
Subject: Re: [PATCH net-next] qed: Remove set but not used variable 'p_link'
Message-Id: <20200204.093354.137606525383512342.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200204022442.109809-1-yuehaibing@huawei.com>
In-Reply-To: <20200204022442.109809-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: aelior@marvell.com, michal.kalderon@marvell.com, GR-everest-linux-l2@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, hulkci@huawei.com

From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 4 Feb 2020 02:24:41 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/qlogic/qed/qed_cxt.c: In function 'qed_qm_init_pf':
> drivers/net/ethernet/qlogic/qed/qed_cxt.c:1401:29: warning:
>  variable 'p_link' set but not used [-Wunused-but-set-variable]
> 
> commit 92fae6fb231f ("qed: FW 8.42.2.0 Queue Manager changes")
> leave behind this unused variable.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thank you.
