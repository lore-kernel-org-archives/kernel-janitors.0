From: Lee Jones <lee.jones@linaro.org>
Date: Wed, 10 Feb 2021 16:12:58 +0000
Subject: Re: [PATCH] video: use getter/setter functions
Message-Id: <20210210161258.GA124276@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210209211325.1261842-1-Julia.Lawall@inria.fr>
 <20210210082341.GH220368@dell>
 <YCPbxSHWMipTz+mB@phenom.ffwll.local>
In-Reply-To: <YCPbxSHWMipTz+mB@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, linux-fbdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, 10 Feb 2021, Daniel Vetter wrote:

> On Wed, Feb 10, 2021 at 08:23:41AM +0000, Lee Jones wrote:
> > On Tue, 09 Feb 2021, Julia Lawall wrote:
> > 
> > > Use getter and setter functions, for platform_device structures and a
> > > spi_device structure.
> > > 
> > > Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> > > 
> > > ---
> > >  drivers/video/backlight/qcom-wled.c                                  |    2 +-
> > 
> > This patch is fine.
> > 
> > Could you please split it out and submit it separately though please.
> 
> Or just apply the entire patch through backlight tree, there's nothing
> going on in fbdev anyway I think.
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I can do that.  Is that an fbdev Ack?

> > >  drivers/video/fbdev/amifb.c                                          |    4 ++--
> > >  drivers/video/fbdev/da8xx-fb.c                                       |    4 ++--
> > >  drivers/video/fbdev/imxfb.c                                          |    2 +-
> > >  drivers/video/fbdev/omap2/omapfb/displays/panel-lgphilips-lb035q02.c |    6 +++---
> > >  drivers/video/fbdev/omap2/omapfb/dss/dpi.c                           |    4 ++--
> > >  drivers/video/fbdev/omap2/omapfb/dss/dsi.c                           |    4 ++--
> > >  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c                         |    2 +-
> > >  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c                         |    2 +-
> > >  drivers/video/fbdev/xilinxfb.c                                       |    2 +-
> > >  10 files changed, 16 insertions(+), 16 deletions(-)
> > 
> > ...]
> > 
> > > diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> > > index 3bc7800eb0a9..091f07e7c145 100644
> > > --- a/drivers/video/backlight/qcom-wled.c
> > > +++ b/drivers/video/backlight/qcom-wled.c
> > > @@ -1692,7 +1692,7 @@ static int wled_probe(struct platform_device *pdev)
> > >  
> > >  static int wled_remove(struct platform_device *pdev)
> > >  {
> > > -	struct wled *wled = dev_get_drvdata(&pdev->dev);
> > > +	struct wled *wled = platform_get_drvdata(pdev);
> > >  
> > >  	mutex_destroy(&wled->lock);
> > >  	cancel_delayed_work_sync(&wled->ovp_work);
> > 
> > For my own reference (apply this as-is to your sign-off block):
> > 
> >   Acked-for-Backlight-by: Lee Jones <lee.jones@linaro.org>
> > 
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
