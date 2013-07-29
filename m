From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 29 Jul 2013 11:58:38 +0000
Subject: Re: [patch] ALSA: usx2y: remove an unneeded check
Message-Id: <s5hioztfuey.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130728202738.GC8684@elgon.mountain>
In-Reply-To: <20130728202738.GC8684@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Antonio Ospite <ao2@amarulasolutions.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

At Sun, 28 Jul 2013 23:27:38 +0300,
Dan Carpenter wrote:
> 
> The test here is always true because S[i].urb is an array not a pointer.
> Also it's bogus because the intent was to test:
> 	if (S->urb[i]) {
> instead of:
> 	if (S[i].urb) {
> 
> Anway, usb_kill_urb() and usb_free_urb() accept NULL pointers so we can
> just remove this.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi

> 
> diff --git a/sound/usb/usx2y/usbusx2y.c b/sound/usb/usx2y/usbusx2y.c
> index 1f9bbd5..5a51b18 100644
> --- a/sound/usb/usx2y/usbusx2y.c
> +++ b/sound/usb/usx2y/usbusx2y.c
> @@ -305,11 +305,9 @@ static void usX2Y_unlinkSeq(struct snd_usX2Y_AsyncSeq *S)
>  {
>  	int	i;
>  	for (i = 0; i < URBS_AsyncSeq; ++i) {
> -		if (S[i].urb) {
> -			usb_kill_urb(S->urb[i]);
> -			usb_free_urb(S->urb[i]);
> -			S->urb[i] = NULL;
> -		}
> +		usb_kill_urb(S->urb[i]);
> +		usb_free_urb(S->urb[i]);
> +		S->urb[i] = NULL;
>  	}
>  	kfree(S->buffer);
>  }
> 
