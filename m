From: Joe Perches <joe@perches.com>
Date: Sun, 02 Jan 2011 21:10:56 +0000
Subject: Re: [PATCH 1/3] staging: keucr: Use memcmp() instead custom
Message-Id: <1294002656.23422.7.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1294002097-3058-2-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1294002097-3058-2-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Sun, 2011-01-02 at 22:01 +0100, Javier Martinez Canillas wrote:
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> diff --git a/drivers/staging/keucr/smilsub.c b/drivers/staging/keucr/smilsub.c
> @@ -1482,54 +1482,55 @@ BYTE _Check_D_DevCode(BYTE dcode)
>  //----- Check_D_ReadError() ----------------------------------------------
>  int Check_D_ReadError(BYTE *redundant)
>  {
> -    // Driver 䣰 ECC Check
> -    return(SUCCESS);
> -    if (!StringCmp((char *)(redundant+0x0D),(char *)EccBuf,3))
> -        if (!StringCmp((char *)(redundant+0x08),(char *)(EccBuf+0x03),3))
> -            return(SUCCESS);
> +	/* Driver ECC Check */
> +	if (memcmp(redundant + 0x0D, EccBuf, 3) ||
> +	    memcmp(redundant + 0x08, EccBuf + 0x03, 3))
> +		return ERROR;
>  
> -    return(ERROR);
> +	return SUCCESS;
>  }

This code isn't the same.

Before, the return was always SUCCESS and the code
after the first return was ignored.

You deleted that return and now you do the driver ECC check.
Is that correct?
 
>  //----- Check_D_Correct() ----------------------------------------------
>  int Check_D_Correct(BYTE *buf,BYTE *redundant)
>  {
> -    // Driver 䣰 ECC Check
> -    return(SUCCESS);
> -    if (StringCmp((char *)(redundant+0x0D),(char *)EccBuf,3))
> -        if (_Correct_D_SwECC(buf,redundant+0x0D,EccBuf))
> -            return(ERROR);
> +	/* Driver ECC Check */
> +	if (memcmp(redundant + 0x0D, EccBuf, 3) &&
> +	    _Correct_D_SwECC(buf, redundant + 0x0D, EccBuf))
> +		return ERROR

Here too.


