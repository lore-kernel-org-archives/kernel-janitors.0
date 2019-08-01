From: Leon Romanovsky <leon@kernel.org>
Date: Thu, 01 Aug 2019 07:54:58 +0000
Subject: Re: [PATCH] RDMA/hns: Fix error return code in hns_roce_v1_rsv_lp_qp()
Message-Id: <20190801075458.GF4832@mtr-leonro.mtl.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190801012725.150493-1-weiyongjun1@huawei.com>
In-Reply-To: <20190801012725.150493-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Lijun Ou <oulijun@huawei.com>, "Wei Hu(Xavier)" <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Colin Ian King <colin.king@canonical.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 01, 2019 at 01:27:25AM +0000, Wei Yongjun wrote:
> Fix to return error code -ENOMEM from the rdma_zalloc_drv_obj() error
> handling case instead of 0, as done elsewhere in this function.
>
> Fixes: e8ac9389f0d7 ("RDMA: Fix allocation failure on pointer pd")
> Fixes: 21a428a019c9 ("RDMA: Handle PD allocations by IB/core")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hw_v1.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Thanks,
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
