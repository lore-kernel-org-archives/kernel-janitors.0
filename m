From: Jason Gunthorpe <jgg@mellanox.com>
Date: Tue, 25 Jun 2019 13:19:15 +0000
Subject: Re: [PATCH][next] RDMA/hns: fix potential integer overflow on left shift
Message-Id: <20190625131911.GA10878@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190624214608.11765-1-colin.king@canonical.com>
In-Reply-To: <20190624214608.11765-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Jun 24, 2019 at 10:46:08PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a potential integer overflow when int i is left shifted
> as this is evaluated using 32 bit arithmetic but is being used in
> a context that expects an expression of type dma_addr_t.  Fix this
> by casting integer i to dma_addr_t before shifting to avoid the
> overflow.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 2ac0bc5e725e ("RDMA/hns: Add a group interfaces for optimizing buffers getting flow")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to for-next, thanks

Jason
