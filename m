From: Neil Armstrong <narmstrong@baylibre.com>
Date: Wed, 15 Apr 2020 07:56:38 +0000
Subject: Re: [PATCH] drm/meson: Delete an error message in meson_dw_hdmi_bind()
Message-Id: <54e0b6e4-4a39-c567-7355-2b2330a95294@baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <76f24122-4d3f-7670-9f06-edb4731a0661@web.de>
In-Reply-To: <76f24122-4d3f-7670-9f06-edb4731a0661@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

Hi,

On 05/04/2020 13:23, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 13:13:03 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index e8c94915a4fc..64cb6ba4bc42 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -1034,10 +1034,8 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>  		return PTR_ERR(dw_plat_data->regm);
> 
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_err(dev, "Failed to get hdmi top irq\n");
> +	if (irq < 0)
>  		return irq;
> -	}
> 
>  	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_top_irq,
>  					dw_hdmi_top_thread_irq, IRQF_SHARED,
> --
> 2.26.0
> 

Missing Fixes tag, but I'll apply nevertheless:
Fixes: 3f68be7d8e96 ("drm/meson: Add support for HDMI encoder and DW-HDMI bridge + PHY")

Neil
