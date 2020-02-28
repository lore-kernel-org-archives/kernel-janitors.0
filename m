From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 28 Feb 2020 16:43:37 +0000
Subject: Re: [PATCH -next] RDMA/bnxt_re: Remove set but not used variable 'pg_size'
Message-Id: <20200228164337.GA7181@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200227064209.87893-1-yuehaibing@huawei.com>
In-Reply-To: <20200227064209.87893-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Selvin Xavier <selvin.xavier@broadcom.com>, Devesh Sharma <devesh.sharma@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Thu, Feb 27, 2020 at 06:42:09AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/hw/bnxt_re/qplib_res.c: In function '__alloc_pbl':
> drivers/infiniband/hw/bnxt_re/qplib_res.c:109:13: warning:
>  variable 'pg_size' set but not used [-Wunused-but-set-variable]
> 
> commit 0c4dcd602817 ("RDMA/bnxt_re: Refactor hardware queue memory allocation")
> involved this, but not used, so remove it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/hw/bnxt_re/qplib_res.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to for-next, thanks

Jason
