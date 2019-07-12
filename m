From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 12 Jul 2019 13:07:55 +0000
Subject: Re: [PATCH -next] platform/x86: mlx-platform: Fix error handling in mlxplat_init()
Message-Id: <CAHp75Vf5_UjW6mXhn-rLPNjSaeRTJt7GGaseTXObk3t5HO-CLw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533700830-137279-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1533700830-137279-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 9, 2019 at 4:32 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Add the missing platform_device_unregister() before return
> from mlxplat_init() in the error handling case.
>

Applied, thanks!

> Fixes: 6b266e91a071 ("platform/x86: mlx-platform: Move regmap initialization before all drivers activation")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/platform/x86/mlx-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 2b98f299faa4..8fe51e43f1bc 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -2111,7 +2111,7 @@ static int __init mlxplat_init(void)
>                                         mlxplat_regmap_config);
>         if (IS_ERR(priv->regmap)) {
>                 err = PTR_ERR(priv->regmap);
> -               return err;
> +               goto fail_alloc;
>         }
>
>         err = mlxplat_mlxcpld_verify_bus_topology(&nr);
>
>
>


-- 
With Best Regards,
Andy Shevchenko
