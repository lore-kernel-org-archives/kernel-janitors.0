From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Mar 2020 13:14:29 +0000
Subject: Re: [PATCH net-next] liquidio: remove set but not used variable 's'
Message-Id: <20200320131429.GH4650@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200306023254.61731-1-yuehaibing@huawei.com>
 <20200319120743.28056-1-yuehaibing@huawei.com>
 <20200319121035.GO126814@unreal>
In-Reply-To: <20200319121035.GO126814@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leonro@mellanox.com>
Cc: YueHaibing <yuehaibing@huawei.com>, Derek Chickles <dchickles@marvell.com>, "David S . Miller" <davem@davemloft.net>, Satanand Burla <sburla@marvell.com>, Felix Manlunas <fmanlunas@marvell.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Thu, Mar 19, 2020 at 02:10:35PM +0200, Leon Romanovsky wrote:
> On Thu, Mar 19, 2020 at 12:07:43PM +0000, YueHaibing wrote:
> > Fixes gcc '-Wunused-but-set-variable' warning:
> >
> > drivers/net/ethernet/cavium/liquidio/lio_main.c: In function 'octeon_chip_specific_setup':
> > drivers/net/ethernet/cavium/liquidio/lio_main.c:1378:8: warning:
> >  variable 's' set but not used [-Wunused-but-set-variable]
> >
> > It's not used since commit b6334be64d6f ("net/liquidio: Delete driver version assignment")
> >
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > ---
> >  drivers/net/ethernet/cavium/liquidio/lio_main.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> 
> I'm sorry for missing this warning.
> 

The warning is not enabled by default.

regards,
dan carpenter
