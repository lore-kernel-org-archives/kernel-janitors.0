From: Takashi Iwai <tiwai@suse.de>
Date: Fri, 01 May 2020 10:27:10 +0000
Subject: Re: [PATCH] ALSA: isa/wavefront: prevent out of bounds write in ioctl
Message-Id: <s5himhghrwh.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200501094011.GA960082@mwanda>
In-Reply-To: <20200501094011.GA960082@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Armijn Hemel <armijn@tjaldur.nl>, Allison Randal <allison@lohutok.net>

On Fri, 01 May 2020 11:40:11 +0200,
Dan Carpenter wrote:
> 
> The "header->number" comes from the ioctl and it needs to be clamped to
> prevent out of bounds writes.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied now.  Thanks.


Takashi

> ---
> This code predates git.
> 
>  sound/isa/wavefront/wavefront_synth.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/isa/wavefront/wavefront_synth.c b/sound/isa/wavefront/wavefront_synth.c
> index c5b1d5900eed2..d6420d224d097 100644
> --- a/sound/isa/wavefront/wavefront_synth.c
> +++ b/sound/isa/wavefront/wavefront_synth.c
> @@ -1171,7 +1171,10 @@ wavefront_send_alias (snd_wavefront_t *dev, wavefront_patch_info *header)
>  				      "alias for %d\n",
>  				      header->number,
>  				      header->hdr.a.OriginalSample);
> -    
> +
> +	if (header->number >= WF_MAX_SAMPLE)
> +		return -EINVAL;
> +
>  	munge_int32 (header->number, &alias_hdr[0], 2);
>  	munge_int32 (header->hdr.a.OriginalSample, &alias_hdr[2], 2);
>  	munge_int32 (*((unsigned int *)&header->hdr.a.sampleStartOffset),
> @@ -1202,6 +1205,9 @@ wavefront_send_multisample (snd_wavefront_t *dev, wavefront_patch_info *header)
>  	int num_samples;
>  	unsigned char *msample_hdr;
>  
> +	if (header->number >= WF_MAX_SAMPLE)
> +		return -EINVAL;
> +
>  	msample_hdr = kmalloc(WF_MSAMPLE_BYTES, GFP_KERNEL);
>  	if (! msample_hdr)
>  		return -ENOMEM;
> -- 
> 2.26.2
> 
