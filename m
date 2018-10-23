From: David Miller <davem@davemloft.net>
Date: Tue, 23 Oct 2018 02:29:23 +0000
Subject: Re: [PATCH net-next] octeontx2-af: Remove set but not used variable 'block'
Message-Id: <20181022.192923.317319591220007582.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539953488-191102-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539953488-191102-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 19 Oct 2018 12:51:28 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c: In function 'rvu_npa_init':
> drivers/net/ethernet/marvell/octeontx2/af/rvu_npa.c:446:20: warning:
>  variable 'block' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction in
> commit 7a37245ef23f ("octeontx2-af: NPA block admin queue init")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
