From: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Date: Sun, 20 Dec 2020 13:30:27 +0000
Subject: Re: [PATCH] hwrng: ingenic - Fix a resource leak in an error handling path
Message-Id: <c5bb8f9a-c4a7-7ecb-eccb-a31abc7316a2@wanyeetech.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201219075207.176279-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201219075207.176279-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mpm@selenic.com, herbert@gondor.apana.org.au, aric.pzqi@ingenic.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,

On 2020/12/19 下午3:52, Christophe JAILLET wrote:
> In case of error, we should call 'clk_disable_unprepare()' to undo a
> previous 'clk_prepare_enable()' call, as already done in the remove
> function.
>
> Fixes: 406346d22278 ("hwrng: ingenic - Add hardware TRNG for Ingenic X1830")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/char/hw_random/ingenic-trng.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)


Thanks for fixing it, and apologize for my carelessness.

Tested-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>


> diff --git a/drivers/char/hw_random/ingenic-trng.c b/drivers/char/hw_random/ingenic-trng.c
> index 954a8411d67d..0eb80f786f4d 100644
> --- a/drivers/char/hw_random/ingenic-trng.c
> +++ b/drivers/char/hw_random/ingenic-trng.c
> @@ -113,13 +113,17 @@ static int ingenic_trng_probe(struct platform_device *pdev)
>   	ret = hwrng_register(&trng->rng);
>   	if (ret) {
>   		dev_err(&pdev->dev, "Failed to register hwrng\n");
> -		return ret;
> +		goto err_unprepare_clk;
>   	}
>   
>   	platform_set_drvdata(pdev, trng);
>   
>   	dev_info(&pdev->dev, "Ingenic DTRNG driver registered\n");
>   	return 0;
> +
> +err_unprepare_clk:
> +	clk_disable_unprepare(trng->clk);
> +	return ret;
>   }
>   
>   static int ingenic_trng_remove(struct platform_device *pdev)
