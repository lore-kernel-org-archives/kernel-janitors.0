From: Joe Perches <joe@perches.com>
Date: Fri, 31 Dec 2010 20:26:00 +0000
Subject: Re: [PATCH 1/2] staging: keucr: Use memcmp() instaed of custom
Message-Id: <1293827160.4058.17.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1293823712-6273-2-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1293823712-6273-2-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Fri, 2010-12-31 at 20:28 +0100, Javier Martinez Canillas wrote:
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>

Hi Javier.

> diff --git a/drivers/staging/keucr/smilsub.c b/drivers/staging/keucr/smilsub.c

[]

>  int Check_D_ReadError(BYTE *redundant)
>  {
> -    // Driver 䣰 ECC Check
> -    return(SUCCESS);
> -    if (!StringCmp((char *)(redundant+0x0D),(char *)EccBuf,3))
> -        if (!StringCmp((char *)(redundant+0x08),(char *)(EccBuf+0x03),3))
> -            return(SUCCESS);
> +	/* Driver ECC Check */
> +	return SUCCESS;
> +	if (!memcmp(redundant+0x0D, EccBuf, 3))
> +		if (!memcmp(redundant+0x08, EccBuf+0x03, 3))
> +			return SUCCESS;

Generally, it's better to have success at the end
of a function and either a goto error or return
error for error conditions.

Something like:

	if (!(!memcmp(redundant+0x0D, EccBuf, 3) &&
	      !memcmp(redundant+0x08, EccBuf+0x03, 3)))
		return ERROR;

	return SUCCESS;

>  int Check_D_Correct(BYTE *buf,BYTE *redundant)
>  {
> -    // Driver 䣰 ECC Check
> -    return(SUCCESS);
> -    if (StringCmp((char *)(redundant+0x0D),(char *)EccBuf,3))
> -        if (_Correct_D_SwECC(buf,redundant+0x0D,EccBuf))
> -            return(ERROR);
> -
> -    buf+=0x100;
> -    if (StringCmp((char *)(redundant+0x08),(char *)(EccBuf+0x03),3))
> -        if (_Correct_D_SwECC(buf,redundant+0x08,EccBuf+0x03))
> -            return(ERROR);
> -
> -    return(SUCCESS);
> +	/* Driver ECC Check */
> +	return SUCCESS;
> +	if (memcmp(redundant+0x0D, EccBuf, 3))
> +		if (_Correct_D_SwECC(buf, redundant+0x0D, EccBuf))
> +			return ERROR;

You might as well take out useless code after returns
instead of just changing function names.

If you keep it you should reformat it.

	if (memcmp(redundant+0x0D, EccBuf, 3) &&
	    _Correct_D_SwECC(buf, redundant+0x0D, EccBuf))
		return ERROR;

etc...


