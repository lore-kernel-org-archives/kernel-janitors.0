From: Takashi Iwai <tiwai@suse.de>
Date: Wed, 30 Dec 2015 21:51:02 +0000
Subject: Re: [PATCH] ALSA: cs5535audio: constify cs5535audio_dma_ops structures
Message-Id: <s5h8u4btxkp.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451472293-14168-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451472293-14168-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jaya Kumar <jayakumar.alsa@gmail.com>, alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 30 Dec 2015 11:44:53 +0100,
Julia Lawall wrote:
> 
> The cs5535audio_dma_ops structures are never modified, so declare them as
> const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.


Takashi

> 
> ---
>  sound/pci/cs5535audio/cs5535audio_pcm.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/pci/cs5535audio/cs5535audio_pcm.c b/sound/pci/cs5535audio/cs5535audio_pcm.c
> index 9c2dc91..27fa57d 100644
> --- a/sound/pci/cs5535audio/cs5535audio_pcm.c
> +++ b/sound/pci/cs5535audio/cs5535audio_pcm.c
> @@ -402,7 +402,7 @@ static struct snd_pcm_ops snd_cs5535audio_capture_ops = {
>  	.pointer =	snd_cs5535audio_pcm_pointer,
>  };
>  
> -static struct cs5535audio_dma_ops snd_cs5535audio_playback_dma_ops = {
> +static const struct cs5535audio_dma_ops snd_cs5535audio_playback_dma_ops = {
>          .type = CS5535AUDIO_DMA_PLAYBACK,
>          .enable_dma = cs5535audio_playback_enable_dma,
>          .disable_dma = cs5535audio_playback_disable_dma,
> @@ -412,7 +412,7 @@ static struct cs5535audio_dma_ops snd_cs5535audio_playback_dma_ops = {
>          .read_dma_pntr = cs5535audio_playback_read_dma_pntr,
>  };
>  
> -static struct cs5535audio_dma_ops snd_cs5535audio_capture_dma_ops = {
> +static const struct cs5535audio_dma_ops snd_cs5535audio_capture_dma_ops = {
>          .type = CS5535AUDIO_DMA_CAPTURE,
>          .enable_dma = cs5535audio_capture_enable_dma,
>          .disable_dma = cs5535audio_capture_disable_dma,
> 
> 
