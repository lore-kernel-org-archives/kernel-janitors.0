From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 27 May 2019 07:37:30 +0000
Subject: Re: [PATCH][next] ASoC: cx2072x: fix spelling mistake "configued" -> "configured"
Message-Id: <s5h8sus9wlh.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190525203244.7829-1-colin.king@canonical.com>
In-Reply-To: <20190525203244.7829-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 25 May 2019 22:32:44 +0200,
Colin King wrote:
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err error message. Fit it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi


> ---
>  sound/soc/codecs/cx2072x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
> index e8e6fd2e97b6..f25376789c5c 100644
> --- a/sound/soc/codecs/cx2072x.c
> +++ b/sound/soc/codecs/cx2072x.c
> @@ -933,7 +933,7 @@ static int cx2072x_hw_params(struct snd_pcm_substream *substream,
>  		return frame_size;
>  
>  	if (cx2072x->mclk_rate = 0) {
> -		dev_err(dev, "Master clock rate is not configued\n");
> +		dev_err(dev, "Master clock rate is not configured\n");
>  		return -EINVAL;
>  	}
>  
> -- 
> 2.20.1
> 
> 
