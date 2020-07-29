From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 29 Jul 2020 07:25:57 +0000
Subject: Re: [PATCH -next] drm: xlnx: Fix typo in parameter description
Message-Id: <CAKMK7uEKRrfHzmZ2mh++bQTmNeBuhpKsz2K2b83oM0SXBMOGFg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200725063429.172139-1-weiyongjun1@huawei.com>
 <20200728220205.GJ6419@phenom.ffwll.local>
 <20200728223543.GU13753@pendragon.ideasonboard.com>
 <20200729002944.GA11598@xilinx.com>
In-Reply-To: <20200729002944.GA11598@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Hulk Robot <hulkci@huawei.com>, Michal Simek <michals@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Jul 29, 2020 at 2:33 AM Hyun Kwon <hyun.kwon@xilinx.com> wrote:
>
> Hello,
>
> On Tue, Jul 28, 2020 at 03:35:43PM -0700, Laurent Pinchart wrote:
> > On Wed, Jul 29, 2020 at 12:02:05AM +0200, daniel@ffwll.ch wrote:
> > > Hi Hyun Kwon,
> > >
> > > Are you all sorted with drm-misc commit rights so you can push the 3
> > > (maybe there's more) xlnx fixup patches to drm-misc-next-fixes?
> >
> > Thanks Daniel for bringing this up.
> >
> > Hyun, would that work for you ?
> >
>
> Should I commit small fixups directly to,
> https://cgit.freedesktop.org/drm/drm-misc/log/?h=drm-misc-next-fixes?

Well these patches right now need to go there, but that's not always
the case. We have a flowchart for that now:

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html#where-do-i-apply-my-patch

> I received the account for drm-misc a couple years ago, and was able to access
> back then. But now someting has changed, and I can't access at the moment. I'll
> need some time to fix my setup. Maybe some help would be appreciated to speed
> up. I may ping you offline if you don't mind.

Sure, happy to help out.
-Daniel

>
> Thanks,
> -hyun
>
> > > On Sat, Jul 25, 2020 at 06:34:29AM +0000, Wei Yongjun wrote:
> > > > Fix typo in parameter description.
> > > >
> > > > Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
> > > > Reported-by: Hulk Robot <hulkci@huawei.com>
> > > > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > > > ---
> > > >  drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > index 821f7a71e182..3d53638ab15e 100644
> > > > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > > @@ -44,7 +44,7 @@ MODULE_PARM_DESC(aux_timeout_ms, "DP aux timeout value in msec (default: 50)");
> > > >   */
> > > >  static uint zynqmp_dp_power_on_delay_ms = 4;
> > > >  module_param_named(power_on_delay_ms, zynqmp_dp_power_on_delay_ms, uint, 0444);
> > > > -MODULE_PARM_DESC(aux_timeout_ms, "DP power on delay in msec (default: 4)");
> > > > +MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
> > > >
> > > >  /* Link configuration registers */
> > > >  #define ZYNQMP_DP_LINK_BW_SET0x0
> >
> > --
> > Regards,
> >
> > Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
