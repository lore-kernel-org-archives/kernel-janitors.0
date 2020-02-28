From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 28 Feb 2020 16:43:51 +0000
Subject: Re: [PATCH -next] RDMA/bnxt_re: Remove set but not used variable 'dev_attr'
Message-Id: <20200228164351.GB7181@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200227064542.91205-1-yuehaibing@huawei.com>
In-Reply-To: <20200227064542.91205-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Selvin Xavier <selvin.xavier@broadcom.com>, Devesh Sharma <devesh.sharma@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Thu, Feb 27, 2020 at 06:45:42AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/hw/bnxt_re/ib_verbs.c: In function 'bnxt_re_create_gsi_qp':
> drivers/infiniband/hw/bnxt_re/ib_verbs.c:1283:30: warning:
>  variable 'dev_attr' set but not used [-Wunused-but-set-variable]
> 
> commit 8dae419f9ec7 ("RDMA/bnxt_re: Refactor queue pair creation code")
> involved this, but not used, so remove it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/hw/bnxt_re/ib_verbs.c | 2 --
>  1 file changed, 2 deletions(-)

Applied to for-next, thanks

Jason
