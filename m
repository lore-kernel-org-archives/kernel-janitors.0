From: Leon Romanovsky <leonro@mellanox.com>
Date: Tue, 12 Feb 2019 11:29:42 +0000
Subject: Re: [PATCH][next] RDMA: fix allocation failure on pointer pd
Message-Id: <20190212112940.GN21447@mtr-leonro.mtl.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190212112233.25667-1-colin.king@canonical.com>
In-Reply-To: <20190212112233.25667-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Feb 12, 2019 at 11:22:33AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The null check on an allocation failure on pd is currently checking
> if pd is non-null rather than null. Fix this by adding the missing !
> operator.
>
> Fixes: 21a428a019c9 ("RDMA: Handle PD allocations by IB/core")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_hw_v1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Thanks a lot,
Reviewed-by: Leon Romanovsky <leonro@mellanox.com>
