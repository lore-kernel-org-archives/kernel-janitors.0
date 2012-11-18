From: Takashi Iwai <tiwai@suse.de>
Date: Sun, 18 Nov 2012 09:28:46 +0000
Subject: Re: [patch] sound: oss/sb_audio: cap value in sb201_audio_set_speed()
Message-Id: <s5htxsn8dkh.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121117150857.GC19951@elgon.mountain>
In-Reply-To: <20121117150857.GC19951@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Sat, 17 Nov 2012 18:08:57 +0300,
Dan Carpenter wrote:
> 
> We set "s" before we have capped "speed" so it could be the wrong value.
> This could lead to a divide by zero bug.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I fixed a similar bug in this file in Aug.  I'm not sure how I missed
> this one.  I don't see any others I missed.

Thanks, applied.


Takashi

> 
> diff --git a/sound/oss/sb_audio.c b/sound/oss/sb_audio.c
> index b2b3c01..048439a 100644
> --- a/sound/oss/sb_audio.c
> +++ b/sound/oss/sb_audio.c
> @@ -442,7 +442,7 @@ static int sb201_audio_set_speed(int dev, int speed)
>  {
>  	sb_devc *devc = audio_devs[dev]->devc;
>  	int tmp;
> -	int s = speed * devc->channels;
> +	int s;
>  
>  	if (speed > 0)
>  	{
> @@ -452,6 +452,7 @@ static int sb201_audio_set_speed(int dev, int speed)
>  			speed = 44100;
>  		if (devc->opened & OPEN_READ && speed > 15000)
>  			speed = 15000;
> +		s = speed * devc->channels;
>  		devc->tconst = (256 - ((1000000 + s / 2) / s)) & 0xff;
>  		tmp = 256 - devc->tconst;
>  		speed = ((1000000 + tmp / 2) / tmp) / devc->channels;
> 
