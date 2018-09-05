From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 05 Sep 2018 21:56:18 +0000
Subject: Re: [PATCH rdma-next] RDMA/qedr: remove set but not used variable 'ctx'
Message-Id: <20180905215618.GA30370@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535774026-160694-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535774026-160694-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Michal Kalderon <Michal.Kalderon@cavium.com>, Ariel Elior <Ariel.Elior@cavium.com>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Sep 01, 2018 at 03:53:46AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/hw/qedr/verbs.c: In function 'qedr_create_srq':
> drivers/infiniband/hw/qedr/verbs.c:1450:24: warning:
>  variable 'ctx' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Rahul Verma <rahul.verma@cavium.com>
> ---
>  drivers/infiniband/hw/qedr/verbs.c | 2 --
>  1 file changed, 2 deletions(-)

Applied to for-next, thanks

Jason
