From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 18 Jan 2019 20:42:44 +0000
Subject: Re: [PATCH -next] RDMA/qedr: remove set but not used variable 'ib_ctx'
Message-Id: <20190118204244.GA32665@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547695307-134798-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1547695307-134798-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jan 17, 2019 at 03:21:47AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/hw/qedr/verbs.c: In function 'qedr_create_srq':
> drivers/infiniband/hw/qedr/verbs.c:1436:22: warning:
>  variable 'ib_ctx' set but not used [-Wunused-but-set-variable]
> 
> drivers/infiniband/hw/qedr/verbs.c: In function 'qedr_create_user_qp':
> drivers/infiniband/hw/qedr/verbs.c:1701:22: warning:
>  variable 'ib_ctx' set but not used [-Wunused-but-set-variable]
> 
> It not used since commit b0ea0fa5435f ("IB/{core,hw}: Have ib_umem_get extract
> the ib_ucontext from ib_udata")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/hw/qedr/verbs.c | 6 ------
>  1 file changed, 6 deletions(-)

I added a fixes line

Applied to for-next thanks

Jason
