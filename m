From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Date: Thu, 31 May 2018 06:47:44 +0000
Subject: Re: [PATCH] ALSA: xen-front: signdness bug in alsa_prepare()
Message-Id: <2e1e5c3f-229d-4351-369a-0a3e2b1dc31b@epam.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180531062547.xfcmrfx7vmnef6gm@kili.mountain>
In-Reply-To: <20180531062547.xfcmrfx7vmnef6gm@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On 05/31/2018 09:25 AM, Dan Carpenter wrote:
> "sndif_format" needs to be signed for the error handling to work.
>
> Fixes: 1cee559351a7 ("ALSA: xen-front: Implement ALSA virtual sound driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/sound/xen/xen_snd_front_alsa.c b/sound/xen/xen_snd_front_alsa.c
> index 5041f83e98d2..43478f66954a 100644
> --- a/sound/xen/xen_snd_front_alsa.c
> +++ b/sound/xen/xen_snd_front_alsa.c
> @@ -463,7 +463,7 @@ static int alsa_prepare(struct snd_pcm_substream *substream)
>   
>   	if (!stream->is_open) {
>   		struct snd_pcm_runtime *runtime = substream->runtime;
> -		u8 sndif_format;
> +		int sndif_format;
>   		int ret;
>   
>   		sndif_format = to_sndif_format(runtime->format);
Thank you for your patch,
please see 
https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/sound/xen?h=for-next&id4cea591afac9b3dae61793446f83d5be634203

