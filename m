From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 06 Apr 2020 08:19:43 +0000
Subject: Re: [PATCH] drm/sun4i: tcon: Delete an error message in sun4i_tcon_init_irq()
Message-Id: <20200406081943.hwjohk63lfpgrdvf@gilmour.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="2o2zzt4r53mxdgxh"
List-Id: <kernel-janitors.vger.kernel.org>
References: <5a6cf5a7-3f27-5425-4d6a-550a17bc51e3@web.de>
In-Reply-To: <5a6cf5a7-3f27-5425-4d6a-550a17bc51e3@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Tang Bin <tangbin@cmss.chinamobile.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org


--2o2zzt4r53mxdgxh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 05, 2020 at 01:53:05PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 13:45:53 +0200
>
> The function =E2=80=9Cplatform_get_irq=E2=80=9D can log an error already.
> Thus omit a redundant message for the exception handling in the
> calling function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied, thanks

Maxime

--2o2zzt4r53mxdgxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXormHgAKCRDj7w1vZxhR
xcHuAP0WjOHzG00wGwXrC/L73opxmCYhJn2ZOmAfjN2ZfVnbHQEArryLB/dfTFEh
yOQICYvOYcUiHRoH6LIRW07gu19BxQU=
=YqNo
-----END PGP SIGNATURE-----

--2o2zzt4r53mxdgxh--
