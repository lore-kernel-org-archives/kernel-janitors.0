From: Joe Perches <joe@perches.com>
Date: Fri, 15 Sep 2017 18:16:28 +0000
Subject: Re: [PATCH 2/2] [media] stm32-dcmi: Improve four size determinations
Message-Id: <1505499388.27581.13.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <730b535e-39a5-2c2b-f463-e76da967a723@users.sourceforge.net>
 <f4e400ea-9660-05cd-3194-cdf2495a2376@users.sourceforge.net>
In-Reply-To: <f4e400ea-9660-05cd-3194-cdf2495a2376@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Fri, 2017-09-15 at 19:29 +0200, SF Markus Elfring wrote:
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
[]
> @@ -1372,9 +1372,8 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
>  	dcmi->sd_formats = devm_kcalloc(dcmi->dev,
> -					num_fmts, sizeof(struct dcmi_format *),
> +					num_fmts, sizeof(*dcmi->sd_formats),
>  					GFP_KERNEL);
>  	if (!dcmi->sd_formats)
>  		return -ENOMEM;
>  
> -	memcpy(dcmi->sd_formats, sd_fmts,
> -	       num_fmts * sizeof(struct dcmi_format *));
> +	memcpy(dcmi->sd_formats, sd_fmts, num_fmts * sizeof(*dcmi->sd_formats));

devm_kmemdup

