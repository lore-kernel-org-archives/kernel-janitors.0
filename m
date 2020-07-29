From: Hyun Kwon <hyun.kwon@xilinx.com>
Date: Wed, 29 Jul 2020 18:27:53 +0000
Subject: Re: [PATCH][next] drm: xln: fix spelling mistake "failes" -> "failed"
Message-Id: <20200729182753.GA29219@xilinx.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200724111258.14762-1-colin.king@canonical.com>
 <20200728223739.GV13753@pendragon.ideasonboard.com>
In-Reply-To: <20200728223739.GV13753@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Michal Simek <michals@xilinx.com>, Colin King <colin.king@canonical.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Colin,

Thanks for the patch.

On Tue, Jul 28, 2020 at 03:37:39PM -0700, Laurent Pinchart wrote:
> Hi Colin,
> 
> Thank you for the patch.
> 
> On Fri, Jul 24, 2020 at 12:12:58PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > There is a spelling mistake in a dev_dbg messages. Fix it.
> 
> There is a spelling mistake in the commit message, s/xln/xlnx/ ;-)
> 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>

I'll fix the commit message and commit this change to drm-misc-next-fixes soon.

Thanks,
-hyun

> > ---
> >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > index 821f7a71e182..0e1c818746eb 100644
> > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > @@ -1308,7 +1308,7 @@ zynqmp_dp_connector_detect(struct drm_connector *connector, bool force)
> >  		ret = drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
> >  				       sizeof(dp->dpcd));
> >  		if (ret < 0) {
> > -			dev_dbg(dp->dev, "DPCD read failes");
> > +			dev_dbg(dp->dev, "DPCD read failed");
> >  			goto disconnected;
> >  		}
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart
