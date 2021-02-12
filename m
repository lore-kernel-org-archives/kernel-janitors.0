From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 12 Feb 2021 10:02:56 +0000
Subject: Re: [PATCH] video: use getter/setter functions
Message-Id: <20210212100256.GB179940@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
In-Reply-To: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Tue, 09 Feb 2021, Julia Lawall wrote:

> Use getter and setter functions, for platform_device structures and a
> spi_device structure.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---
>  drivers/video/backlight/qcom-wled.c                                  |    2 +-
>  drivers/video/fbdev/amifb.c                                          |    4 ++--
>  drivers/video/fbdev/da8xx-fb.c                                       |    4 ++--
>  drivers/video/fbdev/imxfb.c                                          |    2 +-
>  drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c |    6 +++---
>  drivers/video/fbdev/omap2/omapfb/dss/dpi.c                           |    4 ++--
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c                           |    4 ++--
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c                         |    2 +-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c                         |    2 +-
>  drivers/video/fbdev/xilinxfb.c                                       |    2 +-
>  10 files changed, 16 insertions(+), 16 deletions(-)

I fixed-up the subject line and commit message a bit and applied.

Thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
