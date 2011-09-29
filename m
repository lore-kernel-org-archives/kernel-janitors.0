From: Takashi Iwai <tiwai@suse.de>
Date: Thu, 29 Sep 2011 06:14:25 +0000
Subject: Re: [patch] sound: oss: use strlcpy() in sound_timer_init()
Message-Id: <s5hk48rc1tq.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110929061048.GC4104@elgon.mountain>
In-Reply-To: <20110929061048.GC4104@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Thu, 29 Sep 2011 09:10:48 +0300,
Dan Carpenter wrote:
> 
> sound_timer.info.name is a 32 character buffer.  This function only
> has one caller (in sound/oss/ad1848.c) and it passes as 128 character
> buffer as "name".  I don't know if this is a problem in real life,
> and I doubt we're going to add more OSS drivers so it's unlikely to
> become an issue.  But we may as well take care of it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied now.  Thanks.


Takashi


> diff --git a/sound/oss/sound_timer.c b/sound/oss/sound_timer.c
> index 48cda6c..8021c85 100644
> --- a/sound/oss/sound_timer.c
> +++ b/sound/oss/sound_timer.c
> @@ -320,7 +320,7 @@ void  sound_timer_init(struct sound_lowlev_timer *t, char *name)
>  	n = sound_alloc_timerdev();
>  	if (n = -1)
>  		n = 0;		/* Overwrite the system timer */
> -	strcpy(sound_timer.info.name, name);
> +	strlcpy(sound_timer.info.name, name, sizeof(sound_timer.info.name));
>  	sound_timer_devs[n] = &sound_timer;
>  }
>  EXPORT_SYMBOL(sound_timer_init);
> 
