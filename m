From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 25 Sep 2019 11:06:45 +0000
Subject: Re: [PATCH] cw1200: Fix a signedness bug in cw1200_load_firmware()
Message-Id: <87o8z8zlbu.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105943.GJ3264@mwanda>
In-Reply-To: <20190925105943.GJ3264@mwanda> (Dan Carpenter's message of "Wed,
        25 Sep 2019 13:59:43 +0300")
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
>  drivers/net/wireless/st/cw1200/fwio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/st/cw1200/fwio.c b/drivers/net/wireless/st/cw1200/fwio.c
> index 6574e78e05ea..da767c33dfbb 100644
> --- a/drivers/net/wireless/st/cw1200/fwio.c
> +++ b/drivers/net/wireless/st/cw1200/fwio.c
> @@ -321,7 +321,7 @@ int cw1200_load_firmware(struct cw1200_common *priv)
>  	}
>  
>  	priv->hw_type = cw1200_get_hw_type(val32, &major_revision);
> -	if (priv->hw_type < 0) {
> +	if ((int)priv->hw_type < 0) {
>  		pr_err("Can't deduce hardware type.\n");
>  		ret = -ENOTSUPP;
>  		goto out;

Isn't there any cleaner way to fix this? Like having 'int ret' variable
and assign to priv->hw_type after the error handling?

-- 
Kalle Valo
