From: walter harms <wharms@bfs.de>
Date: Wed, 19 Jul 2017 10:11:29 +0000
Subject: Re: [PATCH] staging: pi433: fix a precedence bug
Message-Id: <596F3051.4020100@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170719095157.3e2rnskjqbva2kwo@mwanda>
In-Reply-To: <20170719095157.3e2rnskjqbva2kwo@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 19.07.2017 11:51, schrieb Dan Carpenter:
> We had intended to do the mask first and then the shift.  Shift has
> higher precedence so we need to add parenthesis.
> 
> Fixes: 874bcba65f9a ("staging: pi433: New driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> index e391ce777bc7..5089449bf775 100644
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -387,7 +387,7 @@ enum lnaGain rf69_get_lna_gain(struct spi_device *spi)
>  
>  	currentValue = READ_REG(REG_LNA);


	is currentValue used again later ?

	iff not (IMHO) it would be more readable to use

	currentValue &= MASK_LNA_CURRENT_GAIN

	here.

	and
         currentValue >>3

	inside the switch()
>  
> -	switch (currentValue & MASK_LNA_CURRENT_GAIN >> 3)  // improvement: change 3 to define
> +	switch ((currentValue & MASK_LNA_CURRENT_GAIN) >> 3)  // improvement: change 3 to define
>  	{
>  	case LNA_GAIN_AUTO:	    return automatic;
>  	case LNA_GAIN_MAX:	    return max;

note:
and instead to add an artificial define for 3, it would be simpler to change the  LNA_GAIN_AUTO/MAX
to the "real" values and drop the >>3 for good.

just my 2 cents,

re,
 wh

> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
