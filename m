From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 01 Oct 2019 12:02:35 +0000
Subject: Re: [PATCH v2] cw1200: Fix a signedness bug in cw1200_load_firmware()
Message-Id: <87a7ak65d0.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191001114501.GA6550@mwanda>
In-Reply-To: <20191001114501.GA6550@mwanda> (Dan Carpenter's message of "Tue,
        1 Oct 2019 14:45:01 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Solomon Peachy <pizza@shaftnet.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The "priv->hw_type" is an enum and in this context GCC will treat it
> as an unsigned int so the error handling will never trigger.
>
> Fixes: a910e4a94f69 ("cw1200: add driver for the ST-E CW1100 & CW1200 WLAN chipsets")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: better style and preserve the error code.
>
>  drivers/net/wireless/st/cw1200/fwio.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/st/cw1200/fwio.c b/drivers/net/wireless/st/cw1200/fwio.c
> index 6574e78e05ea..2a03dc533b6a 100644
> --- a/drivers/net/wireless/st/cw1200/fwio.c
> +++ b/drivers/net/wireless/st/cw1200/fwio.c
> @@ -320,12 +320,12 @@ int cw1200_load_firmware(struct cw1200_common *priv)
>  		goto out;
>  	}
>  
> -	priv->hw_type = cw1200_get_hw_type(val32, &major_revision);
> -	if (priv->hw_type < 0) {
> +	ret = cw1200_get_hw_type(val32, &major_revision);
> +	if (ret < 0) {
>  		pr_err("Can't deduce hardware type.\n");
> -		ret = -ENOTSUPP;
>  		goto out;
>  	}
> +	priv->hw_type = ret;

Thanks, this is indeed much better.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
