From: Sebastian Reichel <sre@kernel.org>
Date: Fri, 27 Oct 2017 18:51:21 +0000
Subject: Re: [PATCH] omapdrm: hdmi4_cec: signedness bug in hdmi4_cec_init()
Message-Id: <20171027185121.cuu7ttnyae3xkjs7@earth>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="h5nlkviggzeunx7d"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171027062705.tmmlbgerpb2v63bj@mwanda>
In-Reply-To: <20171027062705.tmmlbgerpb2v63bj@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Hans Verkuil <hans.verkuil@cisco.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org


--h5nlkviggzeunx7d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 27, 2017 at 09:27:05AM +0300, Dan Carpenter wrote:
> "ret" needs to be signed for the error handling to work.
>=20
> Fixes: 8d7f934df8d8 ("omapdrm: hdmi4_cec: add OMAP4 HDMI CEC support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

-- Sebastian

> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/om=
apdrm/dss/hdmi4_cec.c
> index d86873f2abe6..e626eddf24d5 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
> @@ -352,7 +352,7 @@ int hdmi4_cec_init(struct platform_device *pdev, stru=
ct hdmi_core_data *core,
>  {
>  	const u32 caps =3D CEC_CAP_TRANSMIT | CEC_CAP_LOG_ADDRS |
>  			 CEC_CAP_PASSTHROUGH | CEC_CAP_RC;
> -	unsigned int ret;
> +	int ret;
> =20
>  	core->adap =3D cec_allocate_adapter(&hdmi_cec_adap_ops, core,
>  		"omap4", caps, CEC_MAX_LOG_ADDRS);
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--h5nlkviggzeunx7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlnzgCYACgkQ2O7X88g7
+ppGwBAAhqjHSIks/PDvR4U5R1iehiVeYEd0nLAA841UwjmhNLCg2MMI3KQgis7F
9661zYSGjvYXDwVbHTJ5/ef8bW3or9z7dzIp6k6cYvio1Bvl4HW8svLNV5afo3e6
NNix5BUCVsTAB3glry6GbrFYBHldRb8BYblNMpb/Ye6CDOqxRC0PLgmeGfJLAMVH
1aRCD55aN9phSPIKg7D6M8wpRK2+gP59Y6L4BSY9HCNm0w2rcKY7CeUJRENxuUHI
dcwM//1Z9wE54nfIgXAl5dH5OEcVjvG3tHaQQ/wy4YPkZEoY+biEjmYH2xY8LZ6v
bHTtj2xG8csix1lKqK8q3QspzQ1bzanPPHEk0ejI8zH0SS0bsAUmn4Souhl3xZzC
82s2adi3KZ316FxLx/U400WxV3Auh51Uo8gp1GZGmK/NUl2icW9AKXsm2cTjdI67
uae0Vu21qQUFNCxrz/mW1VtAfqOxepb9ipOX+eUVRi+OOt9xqcvS/xI/UssGHQHJ
zNeTtJxs31bpU5N8HspA+IDtKd5vPH/woqlmJ032pFNqfxLwCzXpKu92P+T1DW/b
t93oTrThlhZJ3VNWuGd7HDRroqI6dKb4eVmAruKQzG6SUh7Kp9AvyrFw3fxFN+2k
vwW88vaFnq6m0v7yW1udZ8tF2ZXhHQyWXf0WnVDzDORKQBtyk1M=
=CDDl
-----END PGP SIGNATURE-----

--h5nlkviggzeunx7d--
