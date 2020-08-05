From: Alex Elder <elder@linaro.org>
Date: Wed, 05 Aug 2020 12:58:06 +0000
Subject: Re: [greybus-dev] [PATCH] staging: greybus: audio: Uninitialized variable in gbaudio_remove_controls
Message-Id: <655f7d92-308e-6c33-e517-2142f767d114@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200804101601.GA392148@mwanda>
In-Reply-To: <20200804101601.GA392148@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Johan Hovold <johan@kernel.org>, Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org

On 8/4/20 5:16 AM, Dan Carpenter wrote:
> The "err" variable is not meaningful so there is no need to print it.
> It's uninitialized on the first iteration through the loop.
> 
> Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This is a good fix, thanks.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>  drivers/staging/greybus/audio_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
> index 8b100a71f02e..237531ba60f3 100644
> --- a/drivers/staging/greybus/audio_helper.c
> +++ b/drivers/staging/greybus/audio_helper.c
> @@ -173,8 +173,7 @@ static int gbaudio_remove_controls(struct snd_card *card, struct device *dev,
>  		id.index = control->index;
>  		kctl = snd_ctl_find_id(card, &id);
>  		if (!kctl) {
> -			dev_err(dev, "%d: Failed to find %s\n", err,
> -				control->name);
> +			dev_err(dev, "Failed to find %s\n", control->name);
>  			continue;
>  		}
>  		err = snd_ctl_remove(card, kctl);
> 
