From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 02 Jul 2020 14:40:49 +0000
Subject: Re: [PATCH][next] ASoC: Intel: bxt-da7219-max98357a: return -EINVAL on unrecognized speaker amplifie
Message-Id: <d79c5d6b-5bb6-3552-d1a6-bbd40f6c3081@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200702114835.37889-1-colin.king@canonical.com>
In-Reply-To: <20200702114835.37889-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 7/2/20 6:48 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if the ctx->spkamp is not recognized an error message is
> reported but the code continues to set up the device with uninitialized
> variables such as the number of widgets.  Fix this by returning -EINVAL
> for unrecognized speaker amplifier types.
> 
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: e1435a1feb18 ("ASoC: Intel: bxt-da7219-max98357a: support MAX98390 speaker amp")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Sounds good, thanks Colin.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/intel/boards/bxt_da7219_max98357a.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> index 4d39253e796b..0c0a717823c4 100644
> --- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
> +++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
> @@ -677,7 +677,7 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
>   		break;
>   	default:
>   		dev_err(card->dev, "Invalid speaker amplifier %d\n", ctx->spkamp);
> -		break;
> +		return -EINVAL;
>   	}
>   
>   	err = snd_soc_dapm_new_controls(&card->dapm, widgets, num_widgets);
> 
