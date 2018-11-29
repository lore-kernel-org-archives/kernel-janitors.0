From: Zhenyu Wang <zhenyuw@linux.intel.com>
Date: Thu, 29 Nov 2018 08:43:43 +0000
Subject: Re: [PATCH] drm/i915/gvt: fix spelling mistake "Interupts" -> "Interrupts"
Message-Id: <20181129084343.GD12743@zhen-hp.sh.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="DVXvgjZtTc9TWCEb"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181125232524.14672-1-colin.king@canonical.com>
In-Reply-To: <20181125232524.14672-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>


--DVXvgjZtTc9TWCEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2018.11.25 23:25:24 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in an error message, fix it.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/i915/gvt/interrupt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/interrupt.c b/drivers/gpu/drm/i915/=
gvt/interrupt.c
> index 5daa23ae566b..6b9d1354ff29 100644
> --- a/drivers/gpu/drm/i915/gvt/interrupt.c
> +++ b/drivers/gpu/drm/i915/gvt/interrupt.c
> @@ -126,7 +126,7 @@ static const char * const irq_name[INTEL_GVT_EVENT_MA=
X] =3D {
>  	[FDI_RX_INTERRUPTS_TRANSCODER_C] =3D "FDI RX Interrupts Combined C",
>  	[AUDIO_CP_CHANGE_TRANSCODER_C] =3D "Audio CP Change Transcoder C",
>  	[AUDIO_CP_REQUEST_TRANSCODER_C] =3D "Audio CP Request Transcoder C",
> -	[ERR_AND_DBG] =3D "South Error and Debug Interupts Combined",
> +	[ERR_AND_DBG] =3D "South Error and Debug Interrupts Combined",
>  	[GMBUS] =3D "Gmbus",
>  	[SDVO_B_HOTPLUG] =3D "SDVO B hotplug",
>  	[CRT_HOTPLUG] =3D "CRT Hotplug",
> --=20
> 2.19.1
>=20

Applied this. Thanks!

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--DVXvgjZtTc9TWCEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCW/+mvwAKCRCxBBozTXgY
JzHFAJ0Zcxz4D8oFO1tsTgZvokHwPgnyjACfeKctWqVMlvRAzp9DtyegAGTRiPw=
=tOOg
-----END PGP SIGNATURE-----

--DVXvgjZtTc9TWCEb--
