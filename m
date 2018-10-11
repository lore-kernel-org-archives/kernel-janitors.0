From: David Miller <davem@davemloft.net>
Date: Thu, 11 Oct 2018 17:06:14 +0000
Subject: Re: [PATCH net-next] octeontx2-af: Remove set but not used variable 'dev'
Message-Id: <20181011.100614.2034835973491118803.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539243427-25309-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539243427-25309-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 11 Oct 2018 07:37:07 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/marvell/octeontx2/af/cgx.c: In function 'cgx_fwi_event_handler':
> drivers/net/ethernet/marvell/octeontx2/af/cgx.c:257:17: warning:
>  variable 'dev' set but not used [-Wunused-but-set-variable]
> 
> It never be used since introduction in
> commit 1463f382f58d ("octeontx2-af: Add support for CGX link management")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
