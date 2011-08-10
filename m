From: Ryan Mallon <rmallon@gmail.com>
Date: Wed, 10 Aug 2011 06:01:43 +0000
Subject: Re: [PATCH] drivers/mtd/nand/bcm_umi_nand.c: add missing kfree/ioremap
Message-Id: <4E421EC7.6090505@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312954935-14592-1-git-send-email-julia@diku.dk>
In-Reply-To: <1312954935-14592-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Scott Branden <sbranden@broadcom.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Jiandong Zheng <jdzheng@broadcom.com>, David Woodhouse <dwmw2@infradead.org>

On 10/08/11 15:42, Julia Lawall wrote:
> From: Julia Lawall<julia@diku.dk>
>
> The error handling code under the #if should be the same as elsewhere in
> the function.
>
> Signed-off-by: Julia Lawall<julia@diku.dk>
>
> ---
>   drivers/mtd/nand/bcm_umi_nand.c |    5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
> index a8ae898..72e8ec2 100644
> --- a/drivers/mtd/nand/bcm_umi_nand.c
> +++ b/drivers/mtd/nand/bcm_umi_nand.c
> @@ -433,8 +433,11 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
>
>   #if USE_DMA
>   	err = nand_dma_init();
> -	if (err != 0)
> +	if (err != 0) {
> +		iounmap(bcm_umi_io_base);
> +		kfree(board_mtd);
>   		return err;
> +	}
>   #endif

This probe function should possibly use goto exits on failure. It 
reduces a bit of code duplication and helps prevent this type of error.

~Ryan

