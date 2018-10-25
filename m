From: Steve Wise <swise@chelsio.com>
Date: Thu, 25 Oct 2018 15:26:57 +0000
Subject: Re: [PATCH] RDMA/cxgb3: Fix unintended sign extension
Message-Id: <34f7f28b-5f76-f6d0-d896-9a5550a8e3df@chelsio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181025143131.4048-1-colin.king@canonical.com>
In-Reply-To: <20181025143131.4048-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 10/25/2018 9:31 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the expression "utx_len << 28", utx_len starts as u8, but is promoted
> to a signed int, then sign-extended to u64.  If utx_len is 0xf8 or greater
> then the sign extension will set all the upper bits of utx_cmd which is
> probably not what was intended.  Cast to utx_len to u64  to avoid the sign
> extension.
> 
> Detected by CoverityScan, CID#138764 ("Unintended sign extension")
> 
> Fixes: b038ced7b370 ("RDMA/cxgb3: Add driver for Chelsio T3 RNIC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/cxgb3/cxio_hal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/cxgb3/cxio_hal.c b/drivers/infiniband/hw/cxgb3/cxio_hal.c
> index dcb4bba522ba..c5cb80ccc6d6 100644
> --- a/drivers/infiniband/hw/cxgb3/cxio_hal.c
> +++ b/drivers/infiniband/hw/cxgb3/cxio_hal.c
> @@ -647,7 +647,7 @@ static int cxio_hal_ctrl_qp_write_mem(struct cxio_rdev *rdev_p, u32 addr,
>  		wqe += (sizeof(struct t3_bypass_wr) >> 3);
>  		utx_cmd = (T3_UTX_MEM_WRITE << 28) | (addr + i * 3);
>  		utx_cmd <<= 32;
> -		utx_cmd |= (utx_len << 28) | ((utx_len << 2) + 1);
> +		utx_cmd |= ((u64)utx_len << 28) | ((utx_len << 2) + 1);
>  		*wqe = cpu_to_be64(utx_cmd);
>  		wqe++;
>  		copy_data = (u8 *) data + i * 96;
> 

Acked-by: Steve Wise <swise@chelsio.com>
