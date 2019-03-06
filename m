From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 06 Mar 2019 08:50:11 +0000
Subject: Re: [PATCH] mt76: Fix an IS_ERR() vs NULL check in mt76_wmac_probe()
Message-Id: <875zswfku4.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190306072633.GA2625@kadam>
In-Reply-To: <20190306072633.GA2625@kadam> (Dan Carpenter's message of "Wed, 6
        Mar 2019 10:26:33 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> The devm_ioremap_resource() function never returns NULL, it returns
> error pointers.
>
> Fixes: c8846e101502 ("mt76: add driver for MT7603E and MT7628/7688")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7603/soc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
> index e13fea80d970..b920be1f5718 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7603/soc.c
> @@ -23,9 +23,9 @@ mt76_wmac_probe(struct platform_device *pdev)
>  	}
>  
>  	mem_base = devm_ioremap_resource(&pdev->dev, res);
> -	if (!mem_base) {
> +	if (IS_ERR(mem_base)) {
>  		dev_err(&pdev->dev, "Failed to get memory resource\n");
> -		return -EINVAL;
> +		return PTR_ERR(mem_base);
>  	}

Wei already posted an identical patch:

https://patchwork.kernel.org/patch/10837285/

-- 
Kalle Valo
