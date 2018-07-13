From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Fri, 13 Jul 2018 15:45:32 +0000
Subject: Re: [PATCH] ASoC: qdsp6: q6afe-dai: fix a range check in of_q6afe_parse_dai_data()
Message-Id: <fc36ef7d-87df-f76b-9641-c354dabc69ca@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713150557.gsx7wrau2l7tg2jq@kili.mountain>
In-Reply-To: <20180713150557.gsx7wrau2l7tg2jq@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Patrick Lai <plai@codeaurora.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Niklas Cassel <niklas.cassel@linaro.org>



On 13/07/18 16:05, Dan Carpenter wrote:
> The main thing is that the data->priv[] array has AFE_PORT_MAX elements
> so the > condition should be >=.  But we may as well check for negative
> values as well just to be safe.
> 
> Fixes: 24c4cbcfac09 ("ASoC: qdsp6: q6afe: Add q6afe dai driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch,

Acked-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index e7f809e3ee1f..89df25e711c5 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> @@ -1329,7 +1329,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
>   		int id, i, num_lines;
>   
>   		ret = of_property_read_u32(node, "reg", &id);
> -		if (ret || id > AFE_PORT_MAX) {
> +		if (ret || id < 0 || id >= AFE_PORT_MAX) {
>   			dev_err(dev, "valid dai id not found:%d\n", ret);
>   			continue;
>   		}
> 
