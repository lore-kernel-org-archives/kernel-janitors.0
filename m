From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 10 Jun 2020 17:14:57 +0000
Subject: Re: [PATCH] drm/ast: fix missing break in switch statement for format->cpp[0] case 4
Message-Id: <3286283e-f202-a515-0ae1-89c0d3e855fb@suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="UsxwGtEEheNGlAKZ6LKRC92AjTcFcuLXI"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200610115804.1132338-1-colin.king@canonical.com>
In-Reply-To: <20200610115804.1132338-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UsxwGtEEheNGlAKZ6LKRC92AjTcFcuLXI
Content-Type: multipart/mixed; boundary="Eah6yEBgs72EXQ71v3OZ8NDYMEkLD36Kz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Colin King <colin.king@canonical.com>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <3286283e-f202-a515-0ae1-89c0d3e855fb@suse.de>
Subject: Re: [PATCH] drm/ast: fix missing break in switch statement for
 format->cpp[0] case 4
References: <20200610115804.1132338-1-colin.king@canonical.com>
In-Reply-To: <20200610115804.1132338-1-colin.king@canonical.com>

--Eah6yEBgs72EXQ71v3OZ8NDYMEkLD36Kz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.06.20 um 13:58 schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the switch statement for format->cpp[0] value 4 assigns
> color_index which is never read again and then falls through to the
> default case and returns. This looks like a missing break statement
> bug. Fix this by adding a break statement.
>=20
> Addresses-Coverity: ("Unused value")
> Fixes: 259d14a76a27 ("drm/ast: Split ast_set_vbios_mode_info()")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the fix. I'll test and merge the patch tomorrow.

Best regards
Thomas

> ---
>  drivers/gpu/drm/ast/ast_mode.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index 7d39b858c9f1..3a3a511670c9 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -226,6 +226,7 @@ static void ast_set_vbios_color_reg(struct ast_priv=
ate *ast,
>  	case 3:
>  	case 4:
>  		color_index =3D TrueCModeIndex;
> +		break;
>  	default:
>  		return;
>  	}
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Eah6yEBgs72EXQ71v3OZ8NDYMEkLD36Kz--

--UsxwGtEEheNGlAKZ6LKRC92AjTcFcuLXI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7hFRUACgkQaA3BHVML
eiNuewf+NSC3xjI5ZqB94Yy11a5/KKJtyGy9G3I638ASSLvAjH4PiqkGQCW246p7
QrOnWTdoKlW6XreLjH06r3+9Jb6WafV/ewvzio6+SvuD64edsef6HBekhUlKwYo3
1593l1mh+DKw3o+uGYUBo96Oj5RY3yZrSjfnhAfOd116th4V5YbOOyakfWQ0gEhX
xE0+r9NB+BtY1rPUNDcucYn37j4twAICKVPOX2shYc/Qpoc8cE/QI9Y7J/ktpy11
3LMItZvlevCWP/79zrdpy/buo603otmLkn5Ia8QMtFAKZ+IBIzo97fdHVqrC/aHZ
X3f5bYnUyyOscA5mRY72K1veGuupuQ==
=kXy7
-----END PGP SIGNATURE-----

--UsxwGtEEheNGlAKZ6LKRC92AjTcFcuLXI--
