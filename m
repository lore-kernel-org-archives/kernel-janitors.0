From: Liang Yang <liang.yang@amlogic.com>
Date: Wed, 30 Jan 2019 09:27:10 +0000
Subject: Re: [PATCH][next] mtd: rawnand: meson:: make several functions static
Message-Id: <a1f6dfbd-3434-be6a-c623-794398393609@amlogic.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190129124429.19829-1-colin.king@canonical.com>
In-Reply-To: <20190129124429.19829-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Boris Brezillon <bbrezillon@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On 2019/1/29 20:44, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are several functions that are local to the source and do
> not need to be in global scope, so make them static.
> 
> Cleans up sparse warnings.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/mtd/nand/raw/meson_nand.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> index b9c543d1054c..9557bd94dcd2 100644
> --- a/drivers/mtd/nand/raw/meson_nand.c
> +++ b/drivers/mtd/nand/raw/meson_nand.c
> @@ -829,14 +829,14 @@ static int meson_nfc_read_oob(struct nand_chip *nand, int page)
>   	return meson_nfc_read_page_hwecc(nand, NULL, 1, page);
>   }
>   
> -bool meson_nfc_is_buffer_dma_safe(const void *buffer)
> +static bool meson_nfc_is_buffer_dma_safe(const void *buffer)
>   {
>   	if (virt_addr_valid(buffer) && (!object_is_on_stack(buffer)))
>   		return true;
>   	return false;
>   }
>   
> -void *
> +static void *
>   meson_nand_op_get_dma_safe_input_buf(const struct nand_op_instr *instr)
>   {
>   	if (WARN_ON(instr->type != NAND_OP_DATA_IN_INSTR))
> @@ -848,7 +848,7 @@ meson_nand_op_get_dma_safe_input_buf(const struct nand_op_instr *instr)
>   	return kzalloc(instr->ctx.data.len, GFP_KERNEL);
>   }
>   
> -void
> +static void
>   meson_nand_op_put_dma_safe_input_buf(const struct nand_op_instr *instr,
>   				     void *buf)
>   {
> @@ -863,7 +863,7 @@ meson_nand_op_put_dma_safe_input_buf(const struct nand_op_instr *instr,
>   	kfree(buf);
>   }
>   
> -void *
> +static void *
>   meson_nand_op_get_dma_safe_output_buf(const struct nand_op_instr *instr)
>   {
>   	if (WARN_ON(instr->type != NAND_OP_DATA_OUT_INSTR))
> @@ -876,7 +876,7 @@ meson_nand_op_get_dma_safe_output_buf(const struct nand_op_instr *instr)
>   		       instr->ctx.data.len, GFP_KERNEL);
>   }
>   
> -void
> +static void
>   meson_nand_op_put_dma_safe_output_buf(const struct nand_op_instr *instr,
>   				      const void *buf)
>   {
> 

Looks good to me:

Acked-by: Liang Yang <liang.yang@amlogic.com>
