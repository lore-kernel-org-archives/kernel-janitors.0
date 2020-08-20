From: Rohit Kumar <rohitkr@codeaurora.org>
Date: Thu, 20 Aug 2020 03:56:44 +0000
Subject: Re: [PATCH][next] ASoC: qcom: add missing out of memory check on drvdata->clks allocation
Message-Id: <82bb39d1-c3a9-a8d1-9d96-f4d6d6b0f042@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200819160103.164893-1-colin.king@canonical.com>
In-Reply-To: <20200819160103.164893-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Patrick Lai <plai@codeaurora.org>, Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Ajit Pandey <ajitp@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 8/19/2020 9:31 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently drvdata->clks is not being checked for an allocation failure,
> leading to potential null pointer dereferencing. Fix this by adding a
> check and returning -ENOMEM if an error occurred.
>
> Addresses-Coverity: ("Dereference null return value")
> Fixes: 1220f6a76e77 ("ASoC: qcom: Add common array to initialize soc based core clocks")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks for the fix.

Reviewed-by: Rohit kumar <rohitkr@codeaurora.org>

>   sound/soc/qcom/lpass-apq8016.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index dd9e3dd014f6..5c8ae225cd5d 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -168,6 +168,8 @@ static int apq8016_lpass_init(struct platform_device *pdev)
>   
>   	drvdata->clks = devm_kcalloc(dev, variant->num_clks,
>   				     sizeof(*drvdata->clks), GFP_KERNEL);
> +	if (!drvdata->clks)
> +		return -ENOMEM;
>   	drvdata->num_clks = variant->num_clks;
>   
>   	for (i = 0; i < drvdata->num_clks; i++)

-- 
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the Linux Foundation.
