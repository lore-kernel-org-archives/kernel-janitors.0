From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Date: Mon, 25 Jan 2021 10:20:47 +0000
Subject: RE: [PATCH][next] drm/i915/hdcp: Fix return of value in uninitialized variable ret
Message-Id: <422669df7166485aa5d4acfa3d3bf58e@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210122150957.209779-1-colin.king@canonical.com>
 <87y2glj8v5.fsf@intel.com>
In-Reply-To: <87y2glj8v5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jani Nikula <jani.nikula@linux.intel.com>, Colin King <colin.king@canonical.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "C,
 Ramalingam" <ramalingam.c@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

It is already merged to drm-intel-next 
https://cgit.freedesktop.org/drm/drm-intel/commit/?h=drm-intel-next&id@a6cead28f841ac350bd38dd7260ecacd5eab03

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Friday, January 22, 2021 8:51 PM
> To: Colin King <colin.king@canonical.com>; Joonas Lahtinen
> <joonas.lahtinen@linux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; C, Ramalingam
> <ramalingam.c@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH][next] drm/i915/hdcp: Fix return of value in uninitialized
> variable ret
> 
> On Fri, 22 Jan 2021, Colin King <colin.king@canonical.com> wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Currently when there are other connectors on the port using HDCP the
> > function _intel_hdcp_disable returns a garbage uninitialized value in
> > variable ret.  I believe the intention is to return 0, so return this
> > literal value instead of the value in ret.
> >
> > Addresses-Coverity: ("Uninitialized scalar return")
> > Fixes: 899c8762f981 ("drm/i915/hdcp: Configure HDCP2.2 MST steram
> > encryption status")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Thanks, but there's already a fix in progress:
> 
> http://lore.kernel.org/r/20210119064655.1605-3-anshuman.gupta@intel.com
> 
> BR,
> Jani.
> 
> 
> > ---
> >  drivers/gpu/drm/i915/display/intel_hdcp.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index db8dff2eeb0a..a0e7b0bf892b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -883,7 +883,7 @@ static int _intel_hdcp_disable(struct intel_connector
> *connector)
> >  	 * until it disabled HDCP encryption for all connectors in MST topology.
> >  	 */
> >  	if (dig_port->num_hdcp_streams > 0)
> > -		return ret;
> > +		return 0;
> >
> >  	hdcp->hdcp_encrypted = false;
> >  	intel_de_write(dev_priv, HDCP_CONF(dev_priv, cpu_transcoder, port),
> > 0);
> 
> --
> Jani Nikula, Intel Open Source Graphics Center
