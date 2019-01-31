From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Thu, 31 Jan 2019 22:42:48 +0000
Subject: Re: [PATCH -next] RDMA/hns: Remove set but not used variable 'rst'
Message-Id: <20190131224248.GA6843@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538132393-54509-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538132393-54509-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jan 31, 2019 at 03:19:21PM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/infiniband/hw/hns/hns_roce_hw_v2.c: In function 'hns_roce_v2_qp_flow_control_init':
> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:4384:33: warning:
>  variable 'rst' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to for-next

Thanks,
Jason
