From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 02 Dec 2020 15:54:53 +0000
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: remove some dead code
Message-Id: <7e06abb2-a969-aa1a-6adc-6cdd72e3355c@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8c5gjZO7YN/CFsq@mwanda>
In-Reply-To: <X8c5gjZO7YN/CFsq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

Thanks Dan for the patch!

Do you use any tools to do this checks?


On 02/12/2020 06:51, Dan Carpenter wrote:
> The "decimator" variable is in the 0-7 range and it's unsigned so there
> is no need to check for negative values.
> 
> Fixes: 908e6b1df26e ("ASoC: codecs: lpass-va-macro: Add support to VA Macro")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> ---
>   sound/soc/codecs/lpass-va-macro.c | 15 ++++-----------
>   1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 3e6bbef26dcb..91e6890d6efc 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -844,17 +844,10 @@ static int va_macro_hw_params(struct snd_pcm_substream *substream,
>   
>   	for_each_set_bit(decimator, &va->active_ch_mask[dai->id],
>   			 VA_MACRO_DEC_MAX) {
> -		if (decimator >= 0) {
> -			tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
> -				    VA_MACRO_TX_PATH_OFFSET * decimator;
> -			snd_soc_component_update_bits(component, tx_fs_reg,
> -						0x0F, tx_fs_rate);
> -		} else {
> -			dev_err(va_dev,
> -				"%s: ERROR: Invalid decimator: %d\n",
> -				__func__, decimator);
> -			return -EINVAL;
> -		}
> +		tx_fs_reg = CDC_VA_TX0_TX_PATH_CTL +
> +			    VA_MACRO_TX_PATH_OFFSET * decimator;
> +		snd_soc_component_update_bits(component, tx_fs_reg, 0x0F,
> +					      tx_fs_rate);
>   	}
>   	return 0;
>   }
> 
