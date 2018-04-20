From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 20 Apr 2018 08:09:43 +0000
Subject: Re: [PATCH] mfd: tps65911-comparator: Fix an off by one bug
Message-Id: <20180420080943.jdbf7vtnkc33vbvd@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419134634.GA19793@mwanda>
In-Reply-To: <20180419134634.GA19793@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 19 Apr 2018, Dan Carpenter wrote:

> The tps_comparators[] array is used in two places.  We only access the
> COMP1 (1) and COMP2 (2) elements.  Unfortunately, we're accessing the
> wrong elements and also one element beyond the end of the array.  There
> was supposed to be a zero element at the start of the array which is
> isn't accessed but makes the math work out nicely.

I normally just apply patches from you, but this is a hack, right?

> Fixes: 6851ad3ab346 ("TPS65911: Comparator: Add comparator driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I can't actually compile this code...
> 
> diff --git a/drivers/mfd/tps65911-comparator.c b/drivers/mfd/tps65911-comparator.c
> index c0789f81a1c5..35d7380f6fad 100644
> --- a/drivers/mfd/tps65911-comparator.c
> +++ b/drivers/mfd/tps65911-comparator.c
> @@ -42,6 +42,7 @@ struct comparator {
>  };
>  
>  static struct comparator tps_comparators[] = {
> +	{	.name = "COMP", },
>  	{
>  		.name = "COMP1",
>  		.reg = TPS65911_VMBCH,

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
