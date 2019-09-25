From: Amit Kucheria <amit.kucheria@verdurent.com>
Date: Wed, 25 Sep 2019 14:25:53 +0000
Subject: Re: [PATCH] thermal: st: Use devm_platform_ioremap_resource() in st_mmap_regmap_init()
Message-Id: <CAHLCerNQ4G43O0PM71V6tFSS11oxAGNJEkR0A44CCgRjWfgaag@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <27c67867-d39e-a5c1-12aa-a1e6ba6e7c32@web.de>
In-Reply-To: <27c67867-d39e-a5c1-12aa-a1e6ba6e7c32@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Linux PM list <linux-pm@vger.kernel.org>, Allison Randal <allison@lohutok.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Eduardo Valentin <edubezval@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Zhang Rui <rui.zhang@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Himanshu Jha <himanshujha199640@gmail.com>

On Wed, Sep 18, 2019 at 12:43 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 21:32:14 +0200
>
> Simplify this function implementation by using a known wrapper function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  drivers/thermal/st/st_thermal_memmap.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/thermal/st/st_thermal_memmap.c b/drivers/thermal/st/st_thermal_memmap.c
> index a824b78dabf8..d8ff46abd8eb 100644
> --- a/drivers/thermal/st/st_thermal_memmap.c
> +++ b/drivers/thermal/st/st_thermal_memmap.c
> @@ -121,15 +121,8 @@ static int st_mmap_regmap_init(struct st_thermal_sensor *sensor)
>  {
>         struct device *dev = sensor->dev;
>         struct platform_device *pdev = to_platform_device(dev);
> -       struct resource *res;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(dev, "no memory resources defined\n");
> -               return -ENODEV;
> -       }
> -
> -       sensor->mmio_base = devm_ioremap_resource(dev, res);
> +       sensor->mmio_base = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(sensor->mmio_base)) {
>                 dev_err(dev, "failed to remap IO\n");
>                 return PTR_ERR(sensor->mmio_base);
> --
> 2.23.0
>
