From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Sat, 17 Jul 2010 17:45:33 +0000
Subject: Re: [PATCH 13/15] sound/soc: davinci: check kzalloc() result (typo)
Message-Id: <1279388733.3070.5.camel@odin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279296977-25267-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279296977-25267-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Peter Ujfalusi <peter.ujfalusi@nokia.com>, linux-kernel@vger.kernel.org, Miguel Aguilar <miguel.aguilar@ridgerun.com>

On Fri, 2010-07-16 at 20:16 +0400, Kulikov Vasiliy wrote:
> The code checks 'davinci_vc' after kzalloc() and do not checks
> 'davinci_vcif_dev' that kzalloc() result is assigned to. It seems that
> it is a typo (autocompletion?).
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  sound/soc/davinci/davinci-vcif.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/sound/soc/davinci/davinci-vcif.c b/sound/soc/davinci/davinci-vcif.c
> index 9aa980d..4867853 100644
> --- a/sound/soc/davinci/davinci-vcif.c
> +++ b/sound/soc/davinci/davinci-vcif.c
> @@ -203,7 +203,7 @@ static int davinci_vcif_probe(struct platform_device *pdev)
>  	int ret;
>  
>  	davinci_vcif_dev = kzalloc(sizeof(struct davinci_vcif_dev), GFP_KERNEL);
> -	if (!davinci_vc) {
> +	if (!davinci_vcif_dev) {
>  		dev_dbg(&pdev->dev,
>  			"could not allocate memory for private data\n");
>  		return -ENOMEM;

13,14 & 15

Acked-by: Liam Girdwood <lrg@slimlogic.co.uk>
-- 
Freelance Developer, SlimLogic Ltd
ASoC and Voltage Regulator Maintainer.
http://www.slimlogic.co.uk

