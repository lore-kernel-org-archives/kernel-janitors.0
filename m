From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Feb 2020 08:35:13 +0000
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: remove redundant assignment to variable ret
Message-Id: <20200210083513.GX1778@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208215523.36094-1-colin.king@canonical.com>
In-Reply-To: <20200208215523.36094-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>

On Sat, Feb 08, 2020 at 09:55:23PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment to ret is redundant as it is not used in the error
> return path and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index e1e937eb1dc1..450c394b2882 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -1764,10 +1764,8 @@ static struct davinci_mcasp_pdata *davinci_mcasp_set_pdata_from_of(
>  	} else if (match) {
>  		pdata = devm_kmemdup(&pdev->dev, match->data, sizeof(*pdata),
>  				     GFP_KERNEL);
> -		if (!pdata) {
> -			ret = -ENOMEM;
> +		if (!pdata)
>  			return pdata;

Use a literal NULL for readability.  "return NULL;".

regards,
dan carpenter
