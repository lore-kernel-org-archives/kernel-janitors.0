From: Daniel Mack <daniel@caiaq.de>
Date: Sat, 14 Aug 2010 17:38:24 +0000
Subject: Re: [patch v2] sound/usb/format: silence uninitialized variable
Message-Id: <20100814173824.GX17833@buzzloop.caiaq.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100814085846.GV645@bicker> <s5hbp95xoem.wl%tiwai@suse.de>
	<20100814172953.GA645@bicker>
In-Reply-To: <20100814172953.GA645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Clemens Ladisch <clemens@ladisch.de>, kernel-janitors@vger.kernel.org

On Sat, Aug 14, 2010 at 07:29:53PM +0200, Dan Carpenter wrote:
> Gcc complains that ret might be used uninitialized:
> 
> sound/usb/format.c: In function ‘snd_usb_parse_audio_format’:
> sound/usb/format.c:354: warning: ‘ret’ may be used uninitialized in this function
> sound/usb/format.c:354: note: ‘ret’ was declared here
> sound/usb/format.c:414: warning: ‘ret’ may be used uninitialized in this function
> sound/usb/format.c:414: note: ‘ret’ was declared here
> 
> I suppose it could be uninitialized if there is ever a UAC_VERSION_3
> released. Anyway this patch is worthwhile if only to silence the gcc
> warning.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Yes, such a check can't harm. You can have my 

  Acked-by: Daniel Mack <daniel@caiaq.de>

if you want :)


Thanks,
Daniel

> ---
> V2: Totally different.  Added printk()s
> 
> diff --git a/sound/usb/format.c b/sound/usb/format.c
> index 4387f54..3a13754 100644
> --- a/sound/usb/format.c
> +++ b/sound/usb/format.c
> @@ -392,6 +392,10 @@ static int parse_audio_format_i(struct snd_usb_audio *chip,
>  		/* fp->channels is already set in this case */
>  		ret = parse_audio_format_rates_v2(chip, fp);
>  		break;
> +	default:
> +		snd_printk(KERN_ERR "%d:%u:%d : invalid protocol version %d\n",
> +			   chip->dev->devnum, fp->iface, fp->altsetting, protocol);
> +		return -EINVAL;
>  	}
>  
>  	if (fp->channels < 1) {
> @@ -452,6 +456,10 @@ static int parse_audio_format_ii(struct snd_usb_audio *chip,
>  		ret = parse_audio_format_rates_v2(chip, fp);
>  		break;
>  	}
> +	default:
> +		snd_printk(KERN_ERR "%d:%u:%d : invalid protocol version %d\n",
> +			   chip->dev->devnum, fp->iface, fp->altsetting, protocol);
> +		return -EINVAL;
>  	}
>  
>  	return ret;
