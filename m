From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Fri, 28 Sep 2018 16:14:49 +0000
Subject: Re: [PATCH -next] RDMA/hns: remove set but not used variable 'dseg'
Message-Id: <20180928161449.GD24524@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538132393-54509-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538132393-54509-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 28, 2018 at 10:59:53AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/hw/hns/hns_roce_hw_v2.c: In function 'hns_roce_v2_post_send':
> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:194:35: warning:
>  variable 'dseg' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 7 -------
>  1 file changed, 7 deletions(-)

Applied to for-next, thanks

Jason
