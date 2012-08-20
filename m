From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 20 Aug 2012 08:24:35 +0000
Subject: Re: [patch] oss/sb_audio: prevent divide by zero bug
Message-Id: <s5h393irmws.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120818155515.GA22424@elgon.mountain>
In-Reply-To: <20120818155515.GA22424@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Sat, 18 Aug 2012 18:55:15 +0300,
Dan Carpenter wrote:
> 
> Speed comes from get_user() in audio_ioctl().  We use it to set the "s"
> variable before clamping it to valid values so it could lead to a divide
> by zero bug.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied now.


Takashi


> diff --git a/sound/oss/sb_audio.c b/sound/oss/sb_audio.c
> index 733b014..b2b3c01 100644
> --- a/sound/oss/sb_audio.c
> +++ b/sound/oss/sb_audio.c
> @@ -575,13 +575,15 @@ static int jazz16_audio_set_speed(int dev, int speed)
>  	if (speed > 0)
>  	{
>  		int tmp;
> -		int s = speed * devc->channels;
> +		int s;
>  
>  		if (speed < 5000)
>  			speed = 5000;
>  		if (speed > 44100)
>  			speed = 44100;
>  
> +		s = speed * devc->channels;
> +
>  		devc->tconst = (256 - ((1000000 + s / 2) / s)) & 0xff;
>  
>  		tmp = 256 - devc->tconst;
> 
