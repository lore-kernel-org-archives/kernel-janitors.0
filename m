From: Caesar Wang <caesar.upstream@gmail.com>
Date: Sun, 20 Dec 2015 02:21:50 +0000
Subject: Re: [PATCH] nvmem: delete unneeded IS_ERR test
Message-Id: <567610BE.8010706@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450559973-9067-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450559973-9067-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-arm-kernel@lists.infradead.org

Hi Julia,

Thanks to check this, but there was a patch fixing it.:-)


在 2015年12月20日 05:19, Julia Lawall 写道:
> devm_kzalloc returns NULL rather than an ERR_PTR value.
>
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression x,e;
> @@
>
> * x = devm_kzalloc(...)
> ... when != x = e
> * IS_ERR(x)
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>   drivers/nvmem/rockchip-efuse.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/nvmem/rockchip-efuse.c b/drivers/nvmem/rockchip-efuse.c
> index f552134..811c73c 100644
> --- a/drivers/nvmem/rockchip-efuse.c
> +++ b/drivers/nvmem/rockchip-efuse.c
> @@ -136,8 +136,8 @@ static int rockchip_efuse_probe(struct platform_device *pdev)
>   
>   	context = devm_kzalloc(dev, sizeof(struct rockchip_efuse_context),
>   			       GFP_KERNEL);
> -	if (IS_ERR(context))
> -		return PTR_ERR(context);
> +	if (!context)
> +		return -ENOMEM;

Fixed in this patch[0].

patch[0]:
https://patchwork.kernel.org/patch/7842821/

Thanks,
Caesar
>   
>   	clk = devm_clk_get(dev, "pclk_efuse");
>   	if (IS_ERR(clk))
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

