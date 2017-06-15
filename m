From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Thu, 15 Jun 2017 13:16:03 +0000
Subject: Re: [Intel-gfx] [PATCH][drm-next] drm/i915/cnl: make function cnl_ddi_dp_set_dpll_hw_state static
Message-Id: <20170615131603.GZ12629@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170613134751.29196-1-colin.king@canonical.com>
 <3662e55c-1507-3089-6d97-f96fad013a9c@linux.intel.com>
In-Reply-To: <3662e55c-1507-3089-6d97-f96fad013a9c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>, Colin King <colin.king@canonical.com>

On Wed, Jun 14, 2017 at 02:03:05PM +0100, Tvrtko Ursulin wrote:
>=20
> On 13/06/2017 14:47, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >=20
> > The function cnl_ddi_dp_set_dpll_hw_state does not need to be in global
> > scope, so make it static.
> >=20
> > Cleans up sparse warning:
> > "symbol 'cnl_ddi_dp_set_dpll_hw_state' was not declared. Should it
> >   be static?"
> >=20
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >   drivers/gpu/drm/i915/intel_dpll_mgr.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/intel_dpll_mgr.c b/drivers/gpu/drm/i9=
15/intel_dpll_mgr.c
> > index 8e669b6254ae..2f7b0e64f628 100644
> > --- a/drivers/gpu/drm/i915/intel_dpll_mgr.c
> > +++ b/drivers/gpu/drm/i915/intel_dpll_mgr.c
> > @@ -2292,8 +2292,9 @@ static bool cnl_ddi_hdmi_pll_dividers(struct inte=
l_crtc *crtc,
> >   	return true;
> >   }
> >  =20
> > -bool cnl_ddi_dp_set_dpll_hw_state(int clock,
> > -				  struct intel_dpll_hw_state *dpll_hw_state)
> > +static bool
> > +cnl_ddi_dp_set_dpll_hw_state(int clock,
> > +			     struct intel_dpll_hw_state *dpll_hw_state)
> >   {
> >   	uint32_t cfgcr0;
> >  =20
> >=20
>=20
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Thanks for the patch and review. Pushed to dinq.

--=20
Ville Syrj=E4l=E4
Intel OTC
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
