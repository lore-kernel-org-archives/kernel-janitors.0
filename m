From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Fri, 13 Jul 2018 15:42:47 +0000
Subject: Re: [PATCH] ASoC: qdsp6: q6routing: off by one in routing_hw_params()
Message-Id: <24d37072-bd4f-677f-5216-cca9d040f98a@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713151100.x5usbqhlhrzjmeoq@kili.mountain>
In-Reply-To: <20180713151100.x5usbqhlhrzjmeoq@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Patrick Lai <plai@codeaurora.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Niklas Cassel <niklas.cassel@linaro.org>



On 13/07/18 16:11, Dan Carpenter wrote:
> The data->port_data[] array has AFE_MAX_PORTS elements so the check
> should be >= instead of > or we write one element beyond the end of the
> array.
> 
> Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Thanks for the fix,

Acked-by: Srinivas Kandgatla <srinivas.kandagatla@linaro.org>

> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index 35269b492761..0e7cf9e35d51 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -927,7 +927,7 @@ static int routing_hw_params(struct snd_pcm_substream *substream,
>   	else
>   		path_type = ADM_PATH_LIVE_REC;
>   
> -	if (be_id > AFE_MAX_PORTS)
> +	if (be_id >= AFE_MAX_PORTS)
>   		return -EINVAL;
>   
>   	session = &data->port_data[be_id];
> 
