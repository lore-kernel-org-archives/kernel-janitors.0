From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Date: Wed, 11 Dec 2019 16:23:22 +0000
Subject: Re: [PATCH][next] drm/i915: remove redundant checks for a null fb pointer
Message-Id: <20191211162322.GL1208@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191210142349.333171-1-colin.king@canonical.com>
In-Reply-To: <20191210142349.333171-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>

On Tue, Dec 10, 2019 at 02:23:49PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> A prior check and return when pointer fb is null makes
> subsequent null checks on fb redundant.  Remove the redundant
> null checks.
>=20
> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/i915_debugfs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i=
915_debugfs.c
> index 062e5bef637a..a48478be6e8f 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -2600,8 +2600,8 @@ static void intel_plane_hw_info(struct seq_file *m,=
 struct intel_plane *plane)
>  		       plane_state->hw.rotation);
> =20
>  	seq_printf(m, "\t\thw: fb=3D%d,%s,%dx%d, visible=3D%s, src=3D" DRM_RECT=
_FP_FMT ", dst=3D" DRM_RECT_FMT ", rotation=3D%s\n",
> -		   fb ? fb->base.id : 0, fb ? format_name.str : "n/a",
> -		   fb ? fb->width : 0, fb ? fb->height : 0,
> +		   fb->base.id, format_name.str,
> +		   fb->width, fb->height,

Thanks.

Pushed to drm-intel-next-queued.

>  		   yesno(plane_state->uapi.visible),
>  		   DRM_RECT_FP_ARG(&plane_state->uapi.src),
>  		   DRM_RECT_ARG(&plane_state->uapi.dst),
> --=20
> 2.24.0
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Ville Syrj=E4l=E4
Intel
