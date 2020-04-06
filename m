From: Amit Kucheria <amit.kucheria@verdurent.com>
Date: Mon, 06 Apr 2020 07:42:00 +0000
Subject: Re: [PATCH] thermal: Delete an error message in four functions
Message-Id: <CAHLCerMS5ghVXhOD7RAd5unxEe7w1W4_8hBP5Tf9HvuMEh5Lqg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05f49ae7-5cc7-d6a0-fc3d-abaf2a0b373c@web.de>
In-Reply-To: <05f49ae7-5cc7-d6a0-fc3d-abaf2a0b373c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Clark Williams <williams@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, kernel-janitors@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-rockchip@lists.infradead.org, lakml <linux-arm-kernel@lists.infradead.org>, Zhang Rui <rui.zhang@intel.com>, Alexandre Torgue <alexandre.torgue@st.com>, Linux PM list <linux-pm@vger.kernel.org>, Eduardo Valentin <edubezval@gmail.com>, Pascal Paillet <p.paillet@st.com>, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Allison Randal <allison@lohutok.net>, Tang Bin <tangbin@cmss.chinamobile.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Keerthy <j-keerthy@ti.com>, Colin Ian King <colin.king@canonical.com>

On Sun, Apr 5, 2020 at 10:21 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 18:35:16 +0200
>
> The function “platform_get_irq” can log an error already.
> Thus omit redundant messages for the exception handling in the
> calling functions.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  drivers/thermal/rockchip_thermal.c          | 4 +---
>  drivers/thermal/st/st_thermal_memmap.c      | 4 +---
>  drivers/thermal/st/stm_thermal.c            | 4 +---
>  drivers/thermal/ti-soc-thermal/ti-bandgap.c | 5 ++---
>  4 files changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
> index 7c1a8bccdcba..15a71ecc916c 100644
> --- a/drivers/thermal/rockchip_thermal.c
> +++ b/drivers/thermal/rockchip_thermal.c
> @@ -1241,10 +1241,8 @@ static int rockchip_thermal_probe(struct platform_device *pdev)
>                 return -ENXIO;
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0) {
> -               dev_err(&pdev->dev, "no irq resource?\n");
> +       if (irq < 0)
>                 return -EINVAL;
> -       }
>
>         thermal = devm_kzalloc(&pdev->dev, sizeof(struct rockchip_thermal_data),
>                                GFP_KERNEL);
> diff --git a/drivers/thermal/st/st_thermal_memmap.c b/drivers/thermal/st/st_thermal_memmap.c
> index a824b78dabf8..a0114452d11f 100644
> --- a/drivers/thermal/st/st_thermal_memmap.c
> +++ b/drivers/thermal/st/st_thermal_memmap.c
> @@ -94,10 +94,8 @@ static int st_mmap_register_enable_irq(struct st_thermal_sensor *sensor)
>         int ret;
>
>         sensor->irq = platform_get_irq(pdev, 0);
> -       if (sensor->irq < 0) {
> -               dev_err(dev, "failed to register IRQ\n");
> +       if (sensor->irq < 0)
>                 return sensor->irq;
> -       }
>
>         ret = devm_request_threaded_irq(dev, sensor->irq,
>                                         NULL, st_mmap_thermal_trip_handler,
> diff --git a/drivers/thermal/st/stm_thermal.c b/drivers/thermal/st/stm_thermal.c
> index 9314e3df6a42..331e2b768df5 100644
> --- a/drivers/thermal/st/stm_thermal.c
> +++ b/drivers/thermal/st/stm_thermal.c
> @@ -385,10 +385,8 @@ static int stm_register_irq(struct stm_thermal_sensor *sensor)
>         int ret;
>
>         sensor->irq = platform_get_irq(pdev, 0);
> -       if (sensor->irq < 0) {
> -               dev_err(dev, "%s: Unable to find IRQ\n", __func__);
> +       if (sensor->irq < 0)
>                 return sensor->irq;
> -       }
>
>         ret = devm_request_threaded_irq(dev, sensor->irq,
>                                         NULL,
> diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.c b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
> index 263b0420fbe4..ab19ceff6e2a 100644
> --- a/drivers/thermal/ti-soc-thermal/ti-bandgap.c
> +++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
> @@ -772,10 +772,9 @@ static int ti_bandgap_talert_init(struct ti_bandgap *bgp,
>         int ret;
>
>         bgp->irq = platform_get_irq(pdev, 0);
> -       if (bgp->irq < 0) {
> -               dev_err(&pdev->dev, "get_irq failed\n");
> +       if (bgp->irq < 0)
>                 return bgp->irq;
> -       }
> +
>         ret = request_threaded_irq(bgp->irq, NULL,
>                                    ti_bandgap_talert_irq_handler,
>                                    IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> --
> 2.26.0
>
