From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 31 Mar 2014 08:46:57 +0000
Subject: Re: [patch] ALSA: asihpi: fix some indenting in snd_card_asihpi_pcm_new()
Message-Id: <s5heh1i3gce.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140331074915.GA24854@mwanda>
In-Reply-To: <20140331074915.GA24854@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eldad Zack <eldad@fogrefinery.com>, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org

At Mon, 31 Mar 2014 10:49:15 +0300,
Dan Carpenter wrote:
> 
> This used to be a part of a condition until f3d145aac913 ('ALSA: asihpi:
> MMAP for non-busmaster cards') but now it's not and we can remove an
> indent level.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi

> 
> diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
> index e4e42f2..901c949 100644
> --- a/sound/pci/asihpi/asihpi.c
> +++ b/sound/pci/asihpi/asihpi.c
> @@ -1253,11 +1253,12 @@ static int snd_card_asihpi_pcm_new(struct snd_card_asihpi *asihpi, int device)
>  			num_outstreams,	num_instreams, &pcm);
>  	if (err < 0)
>  		return err;
> +
>  	/* pointer to ops struct is stored, dont change ops afterwards! */
> -		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
> -				&snd_card_asihpi_playback_mmap_ops);
> -		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
> -				&snd_card_asihpi_capture_mmap_ops);
> +	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
> +			&snd_card_asihpi_playback_mmap_ops);
> +	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
> +			&snd_card_asihpi_capture_mmap_ops);
>  
>  	pcm->private_data = asihpi;
>  	pcm->info_flags = 0;
> 
