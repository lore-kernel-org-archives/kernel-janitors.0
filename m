From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 14 Aug 2010 14:24:49 +0000
Subject: Re: [patch] sound/usb/format: silence uninitialized variable warnings
Message-Id: <s5hbp95xoem.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100814085846.GV645@bicker>
In-Reply-To: <20100814085846.GV645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org, Clemens Ladisch <clemens@ladisch.de>, kernel-janitors@vger.kernel.org

At Sat, 14 Aug 2010 10:58:47 +0200,
Dan Carpenter wrote:
> 
> Gcc complains that ret might be used uninitialized:
> 
> sound/usb/format.c: In function ‘snd_usb_parse_audio_format’:
> sound/usb/format.c:354: warning: ‘ret’ may be used uninitialized in this function
> sound/usb/format.c:354: note: ‘ret’ was declared here
> sound/usb/format.c:414: warning: ‘ret’ may be used uninitialized in this function
> sound/usb/format.c:414: note: ‘ret’ was declared here
> 
> I suppose it could be if there is ever a UAC_VERSION_3 released. Anyway
> this patch is worthwhile if only to silence the gcc warning.

It's nice to catch such possible bugs.
But, it'd be even nicer if kernel gives messages what's wrong instead
of silent break-up. 
Could you add error messages and repost the revised patch?


thanks,

Takashi

> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/sound/usb/format.c b/sound/usb/format.c
> index 4387f54..1400174 100644
> --- a/sound/usb/format.c
> +++ b/sound/usb/format.c
> @@ -351,7 +351,8 @@ static int parse_audio_format_i(struct snd_usb_audio *chip,
>  {
>  	struct usb_interface_descriptor *altsd = get_iface_desc(iface);
>  	int protocol = altsd->bInterfaceProtocol;
> -	int pcm_format, ret;
> +	int pcm_format;
> +	int ret = -EINVAL;
>  
>  	if (fmt->bFormatType = UAC_FORMAT_TYPE_III) {
>  		/* FIXME: the format type is really IECxxx
> @@ -411,9 +412,10 @@ static int parse_audio_format_ii(struct snd_usb_audio *chip,
>  				 int format, void *_fmt,
>  				 struct usb_host_interface *iface)
>  {
> -	int brate, framesize, ret;
> +	int brate, framesize;
>  	struct usb_interface_descriptor *altsd = get_iface_desc(iface);
>  	int protocol = altsd->bInterfaceProtocol;
> +	int ret = -EINVAL;
>  
>  	switch (format) {
>  	case UAC_FORMAT_TYPE_II_AC3:
> 
