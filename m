From: Daniel Mack <zonque@gmail.com>
Date: Wed, 13 Mar 2013 10:29:01 +0000
Subject: Re: [patch] ALSA: ASoC: tas5086: signedness bug in tas5086_hw_params()
Message-Id: <514054ED.7050501@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130313053253.GA17674@longonot.mountain>
In-Reply-To: <20130313053253.GA17674@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, kbuild@01.org

On 13.03.2013 06:32, Dan Carpenter wrote:
> "val" has to be signed for the error handling to work.

Absolutely.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Daniel Mack <zonque@gmail.com>


> 
> diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
> index 008bea4..41d03ae 100644
> --- a/sound/soc/codecs/tas5086.c
> +++ b/sound/soc/codecs/tas5086.c
> @@ -251,7 +251,7 @@ static int tas5086_hw_params(struct snd_pcm_substream *substream,
>  {
>  	struct snd_soc_codec *codec = dai->codec;
>  	struct tas5086_private *priv = snd_soc_codec_get_drvdata(codec);
> -	unsigned int val;
> +	int val;
>  	int ret;
>  
>  	priv->rate = params_rate(params);
> 



