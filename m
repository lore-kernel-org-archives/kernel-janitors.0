From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Mon, 03 Jan 2011 16:11:56 +0000
Subject: Re: [PATCH 2/4] staging: keucr: Use memcpy() instead custom
Message-Id: <20110103161156.GA2810@joi.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1294006469-4400-3-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1294006469-4400-3-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jan 02, 2011 at 11:14:27PM +0100, Javier Martinez Canillas wrote:
> staging: keucr: Use memcpy() instead custom StringCopy() and some style cleanups
> 
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> ---
>  drivers/staging/keucr/smilecc.c |   16 ++++++++++------
>  1 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/keucr/smilecc.c b/drivers/staging/keucr/smilecc.c
> index daf322a..5659dea 100644
> --- a/drivers/staging/keucr/smilecc.c
> +++ b/drivers/staging/keucr/smilecc.c
> @@ -182,13 +182,17 @@ BYTE *buf;
>  BYTE *redundant_ecc;
>  BYTE *calculate_ecc;
>  {
> -    DWORD err;
> +	DWORD err;
>  
> -    err=correct_data(buf,redundant_ecc,*(calculate_ecc+1),*(calculate_ecc),*(calculate_ecc+2));
> -    if (err=1) StringCopy(calculate_ecc,redundant_ecc,3);
> -        if (err=0 || err=1 || err=2)
> -            return(0);
> -    return(-1);
> +	err = correct_data(buf, redundant_ecc, *(calculate_ecc + 1),
> +			   *(calculate_ecc), *(calculate_ecc + 2));
> +	if (err = 1)
> +		memcpy(calculate_ecc, redundant_ecc, 3);
> +
> +	if (err = 0 || err = 1 || err = 2)
> +		return 0;
> +
> +	return -1;
>  }
>  
>  void _Calculate_D_SwECC(buf,ecc)
> -- 

Now it looks good.
Reviewed-by: Marcin Slusarz <marcin.slusarz@gmail.com>
