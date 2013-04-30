From: walter harms <wharms@bfs.de>
Date: Tue, 30 Apr 2013 07:49:34 +0000
Subject: Re: [patch] ASoC: wm8994: missing break in wm8994_aif3_hw_params()
Message-Id: <517F778E.3020700@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130430072441.GB7237@elgon.mountain>
In-Reply-To: <20130430072441.GB7237@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Takashi Iwai <tiwai@suse.de>, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>



Am 30.04.2013 09:24, schrieb Dan Carpenter:
> The missing break here means that we always return early and the
> function is a no-op.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> 
> diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
> index 14094f5..1eb152c 100644
> --- a/sound/soc/codecs/wm8994.c
> +++ b/sound/soc/codecs/wm8994.c
> @@ -2882,6 +2882,7 @@ static int wm8994_aif3_hw_params(struct snd_pcm_substream *substream,
>  		default:
>  			return 0;
>  		}
> +		break;
>  	default:
>  		return 0;
>  	}


the patch seems ok, but i would question the wisdom of a nested switch here,
obviously the readability suffers and since it is only one case it seems
better to be replaced it with

if (dai->id != 3) return 0;

Please can the maintainer comment on that ?

just my 2 cents,
 wh

