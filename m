From: Max Gurtovoy <maxg@mellanox.com>
Date: Sun, 24 Feb 2019 14:08:11 +0000
Subject: Re: [PATCH] IB/iser: Fix some error handling in iser_fast_reg_fmr()
Message-Id: <617e986a-18ae-67ec-3572-67d5c9e5c6f0@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220054041.GB25196@kadam>
In-Reply-To: <20190220054041.GB25196@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org


On 2/20/2019 7:40 AM, Dan Carpenter wrote:
> The ib_sg_to_pages() function can return negative error codes.  The
> problem with the error handling is that mem->dma_nents is a u32 so
> the comparison is type promoted to unsigned int.  A negative error code
> thus becomes a large positive value and is treated as valid.
>
> Fixes: 57b26497fabe ("IB/iser: Pass the correct number of entries for dma mapped SGL ")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   drivers/infiniband/ulp/iser/iser_memory.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/infiniband/ulp/iser/iser_memory.c b/drivers/infiniband/ulp/iser/iser_memory.c
> index 2ba70729d7b0..04a9b8f118df 100644
> --- a/drivers/infiniband/ulp/iser/iser_memory.c
> +++ b/drivers/infiniband/ulp/iser/iser_memory.c
> @@ -240,7 +240,7 @@ int iser_fast_reg_fmr(struct iscsi_iser_task *iser_task,
>   	page_vec->fake_mr.page_size = SIZE_4K;
>   	plen = ib_sg_to_pages(&page_vec->fake_mr, mem->sg,
>   			      mem->dma_nents, NULL, iser_set_page);
> -	if (unlikely(plen < mem->dma_nents)) {
> +	if (plen < 0 || plen < mem->dma_nents) {
>   		iser_err("page vec too short to hold this SG\n");
>   		iser_data_buf_dump(mem, device->ib_device);
>   		iser_dump_page_vec(page_vec);

Was the "unlikely" removed in purpose ?

I'm ok with that since Sagi has patches that will remove FMR usage in iSER.

but the below fix is the correct one for future code as well 
(ib_dma_map_sg returns int and not unsigned int):

diff --git a/drivers/infiniband/ulp/iser/iscsi_iser.h 
b/drivers/infiniband/ulp/iser/iscsi_iser.h
index 0bf8512..def8cfe 100644
--- a/drivers/infiniband/ulp/iser/iscsi_iser.h
+++ b/drivers/infiniband/ulp/iser/iscsi_iser.h
@@ -205,7 +205,7 @@ struct iser_data_buf {
     struct scatterlist *sg;
     int                size;
     unsigned long      data_len;
-   unsigned int       dma_nents;
+   int                dma_nents;
  };


thoughts ?
