From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 21 Aug 2015 12:13:50 +0000
Subject: Re: [patch] ALSA: hdsp: silence and underflow warning
Message-Id: <s5hh9ns4z5t.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150821112534.GA983@mwanda>
In-Reply-To: <20150821112534.GA983@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Fri, 21 Aug 2015 13:25:34 +0200,
Dan Carpenter wrote:
> 
> I believe this probably cannot happen, as the code suggests.  There
> would have to be an kcontrol->index.id which was zero, otherwise this
> would be prevented in snd_ctl_find_id().  But snd_BUG_ON() is just a
> WARN() or a no-op so static checkers complain that we keep on going with
> a negative offset.  Let's just handle the error as well as printing
> a warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.


Takashi

> 
> diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
> index c19e021..468a95c 100644
> --- a/sound/pci/rme9652/hdsp.c
> +++ b/sound/pci/rme9652/hdsp.c
> @@ -2806,7 +2806,8 @@ static int snd_hdsp_get_adat_sync_check(struct snd_kcontrol *kcontrol, struct sn
>  	struct hdsp *hdsp = snd_kcontrol_chip(kcontrol);
>  
>  	offset = ucontrol->id.index - 1;
> -	snd_BUG_ON(offset < 0);
> +	if (snd_BUG_ON(offset < 0))
> +		return -EINVAL;
>  
>  	switch (hdsp->io_type) {
>  	case Digiface:
> 
