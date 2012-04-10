From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Apr 2012 06:42:55 +0000
Subject: Re: [PATCH] sound/oss/msnd_pinnacle.c: add vfrees
Message-Id: <s5hpqbgulxs.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1333959392-18933-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1333959392-18933-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, Andrew Veliath <andrewtv@usa.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

At Mon,  9 Apr 2012 10:16:32 +0200,
Julia Lawall wrote:
> 
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> At the point of this error-handling code, HAVE_DSPCODEH may be undefined,
> so free INITCODE and PERMCODE as done elsewhere.  A jump and label are
> introduced to avoid code duplication.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks, applied now.


Takashi

> 
> ---
>  sound/oss/msnd_pinnacle.c |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/oss/msnd_pinnacle.c b/sound/oss/msnd_pinnacle.c
> index 2c79d60..536c4c0 100644
> --- a/sound/oss/msnd_pinnacle.c
> +++ b/sound/oss/msnd_pinnacle.c
> @@ -1294,6 +1294,8 @@ static int __init calibrate_adc(WORD srate)
>  
>  static int upload_dsp_code(void)
>  {
> +	int ret = 0;
> +
>  	msnd_outb(HPBLKSEL_0, dev.io + HP_BLKS);
>  #ifndef HAVE_DSPCODEH
>  	INITCODESIZE = mod_firmware_load(INITCODEFILE, &INITCODE);
> @@ -1312,7 +1314,8 @@ static int upload_dsp_code(void)
>  	memcpy_toio(dev.base, PERMCODE, PERMCODESIZE);
>  	if (msnd_upload_host(&dev, INITCODE, INITCODESIZE) < 0) {
>  		printk(KERN_WARNING LOGNAME ": Error uploading to DSP\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto out;
>  	}
>  #ifdef HAVE_DSPCODEH
>  	printk(KERN_INFO LOGNAME ": DSP firmware uploaded (resident)\n");
> @@ -1320,12 +1323,13 @@ static int upload_dsp_code(void)
>  	printk(KERN_INFO LOGNAME ": DSP firmware uploaded\n");
>  #endif
>  
> +out:
>  #ifndef HAVE_DSPCODEH
>  	vfree(INITCODE);
>  	vfree(PERMCODE);
>  #endif
>  
> -	return 0;
> +	return ret;
>  }
>  
>  #ifdef MSND_CLASSIC
> 
