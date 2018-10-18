From: Borislav Petkov <bp@alien8.de>
Date: Thu, 18 Oct 2018 12:27:14 +0000
Subject: Re: [PATCH] edac: qcom_edac: uninitialized variable in IRQ handler
Message-Id: <20181018122714.GE20831@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181018073807.en2p4tt3qkmdnus6@kili.mountain>
In-Reply-To: <20181018073807.en2p4tt3qkmdnus6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Channagoud Kadabi <ckadabi@codeaurora.org>, Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Oct 18, 2018 at 10:38:07AM +0300, Dan Carpenter wrote:
> We forgot to set "irq_handled" to false, so it's either true or
> uninitialized.
> 
> Fixes: 27450653f1db ("drivers: edac: Add EDAC driver support for QCOM SoCs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/edac/qcom_edac.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/edac/qcom_edac.c b/drivers/edac/qcom_edac.c
> index 82bd775124f2..f8510a024fe5 100644
> --- a/drivers/edac/qcom_edac.c
> +++ b/drivers/edac/qcom_edac.c
> @@ -292,7 +292,7 @@ llcc_ecc_irq_handler(int irq, void *edev_ctl)
>  	struct llcc_drv_data *drv = edac_dev_ctl->pvt_info;
>  	irqreturn_t irq_rc = IRQ_NONE;
>  	u32 drp_error, trp_error, i;
> -	bool irq_handled;
> +	bool irq_handled = false;

That variable is just silly. One can simply do:

	if (!ret)
		irq_rc = IRQ_HANDLED;

in both places and

	return irq_rc;

at the end and remove irq_handled altogether. Problem solved.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
