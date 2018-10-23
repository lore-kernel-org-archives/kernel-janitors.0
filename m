From: David Miller <davem@davemloft.net>
Date: Tue, 23 Oct 2018 02:29:32 +0000
Subject: Re: [PATCH net-next] octeontx2-af: Remove set but not used variables 'devnum, is_pf'
Message-Id: <20181022.192932.357987873245726983.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539954186-193695-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539954186-193695-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 19 Oct 2018 13:03:06 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/marvell/octeontx2/af/rvu.c: In function 'rvu_detach_rsrcs':
> drivers/net/ethernet/marvell/octeontx2/af/rvu.c:855:6: warning:
>  variable 'devnum' set but not used [-Wunused-but-set-variable]
>  
> drivers/net/ethernet/marvell/octeontx2/af/rvu.c:853:7: warning:
>  variable 'is_pf' set but not used [-Wunused-but-set-variable]
> 
> drivers/net/ethernet/marvell/octeontx2/af/rvu.c: In function 'rvu_mbox_handler_ATTACH_RESOURCES':
> drivers/net/ethernet/marvell/octeontx2/af/rvu.c:1054:7: warning:
>  variable 'is_pf' set but not used [-Wunused-but-set-variable]
> 
> drivers/net/ethernet/marvell/octeontx2/af/rvu.c:1053:6: warning:
>  variable 'devnum' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction in commit
> 746ea74241fa ("octeontx2-af: Add RVU block LF provisioning support")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
