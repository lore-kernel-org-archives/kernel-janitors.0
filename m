From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date: Fri, 04 Aug 2017 09:37:09 +0000
Subject: Re: [PATCH] drm/omap: omap_display_timings: constify videomode structures
Message-Id: <487fcede-c33d-83ed-a8d3-7ef504156fa6@ti.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="wMKHhv60BgN9EDwe3HDB7eDeK8KBbl7SN"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501826993-1765-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501826993-1765-1-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Bhumika Goyal <bhumirks@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

--wMKHhv60BgN9EDwe3HDB7eDeK8KBbl7SN
Content-Type: multipart/mixed; boundary="TunGQtuevO63fgrLfEPnqSUDuTedS716a";
 protected-headers="v1"
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bhumika Goyal <bhumirks@gmail.com>
Message-ID: <487fcede-c33d-83ed-a8d3-7ef504156fa6@ti.com>
Subject: Re: [PATCH] drm/omap: omap_display_timings: constify videomode
 structures
References: <1501826993-1765-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501826993-1765-1-git-send-email-Julia.Lawall@lip6.fr>

--TunGQtuevO63fgrLfEPnqSUDuTedS716a
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/08/17 09:09, Julia Lawall wrote:
> The videomode structures are only copied into the vm field of a
> panel_drv_data structure, so they can be const.
>=20
> Done with the help of Coccinelle.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
>  drivers/gpu/drm/omapdrm/displays/panel-lgphilips-lb035q02.c |    2 +-
>  drivers/gpu/drm/omapdrm/displays/panel-tpo-td028ttec1.c     |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied.

 Tomi


--TunGQtuevO63fgrLfEPnqSUDuTedS716a--

--wMKHhv60BgN9EDwe3HDB7eDeK8KBbl7SN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZhEBFAAoJEPo9qoy8lh71t8MP/0/XEs0Ajpq1ayN1ex8QjSKG
Q2RV7GsjnnEWRM/8ULly7Mwta8iAloLESP3eZLUY7m2jQeKWMXL12rtjVsl/4v9j
VVIjURam2D34H1a6xS+7JtVR2bMWCRGyuLi0Fupl2YcVSUB28q+FCx9KzexhwPoZ
zRFWYNo7kiUtsWoOPC21sEyKzsyHYM+HS5LDjQ8GWXpC2ZDuQ2xzyHA0XsWLzc0T
j2walgGO1j8wmDl/KLpErBs7453WLg7bqCZ1426EzjEdZ34wyhPqfjwSNmIb+HB3
A+MUQgl9HoSqpBfV/xahRy02tx04LOq0m46KIkM3O2/cUUZGHk7ZA9alYBz7AWzg
2O7GeT0X3XWVj9QZaxM0yv4OVYsbDODW/Q9IXHPISdI4YdSkIFDipTTjL94QT6vX
93b7BZ3SZPxfzetdwMS/8KezWPErAL1/iOaRx78a1ZiIJVPHYJbLvqihNu6sw96o
Ps9nC+ztsOfyJxbGV8c9fgAnDNn2Dwhl62+IJ/b48kp2LLGVPlFm7ZsalHTZ6yz/
zsNVtlQZzzojjaMC8SM3n/X75QKyKouWSzcH4/pKfjHMXPM6A2LMIg2xOJcJa6x2
4v6KijBSsm3rEDrcH2L+Gs8M6H6118e6JEHfbEPQYpxho5gVQPJLbgItOkbtg85j
JI3M3SK0sWWWQhh4Qnle
=CWqT
-----END PGP SIGNATURE-----

--wMKHhv60BgN9EDwe3HDB7eDeK8KBbl7SN--
