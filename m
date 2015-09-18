From: Doug Ledford <dledford@redhat.com>
Date: Fri, 18 Sep 2015 15:51:52 +0000
Subject: Re: [patch v2] IB/hfi1: info leak in get_ctxt_info()
Message-Id: <55FC3318.4040708@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="xCjIimwECe6pBjLUijb26v9W5MLNgJUD9"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150916064225.GI5004@mwanda>
In-Reply-To: <20150916064225.GI5004@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>, Mike Marciniszyn <infinipath@intel.com>
Cc: Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-rdma@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xCjIimwECe6pBjLUijb26v9W5MLNgJUD9
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 09/16/2015 02:42 AM, Dan Carpenter wrote:
> The cinfo struct has a hole after the last struct member so we need to
> zero it out.  Otherwise we disclose some uninitialized stack data.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


--=20
Doug Ledford <dledford@redhat.com>
              GPG KeyID: 0E572FDD



--xCjIimwECe6pBjLUijb26v9W5MLNgJUD9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIbBAEBCAAGBQJV/DMYAAoJELgmozMOVy/dN6QP93OzYKMLrQDnuS2G52XYBa3d
U1udlxmnLp5wRQl5UjYISMeAjMLBo2Dg92VROIEa1Do7IDatfGwOaBY/jnKHFSJ9
wMJROipcooU+00fNzjMO/1HRxDEn5fdTtLUUETDtLEQYfxYDlgUv4cxjN9SflQkZ
xVeaRETM6pac8AYQBilF/Rp2bP3E0xnkxNHHxmW8FGKaolzVGkY+E+kPPf/It8Dc
x65TRmEFToO5DoHOK7HiFXz+raKGZeUx8VI4aaAg88DC//LmCOg/sfw38Vvxxagf
88AFTr/PSeir6hGe2WEaAOrt68OaIHRsecRY/3zbF+Brr5Ea+P9zn5I0zu/p0GCm
92EoxLzXplSY3grRxtNP1ZfPfWn3TcYyb5yfNnPgbUrey7Yat0M6qNXfdrzBtSgx
oZiHnb1aLCHLbSdMarSC0HUUxCQ9sFsX2OyVCBxTxbfp1G1++WWjShlGI9IBDaJ5
dtCn5WayhsE0Z6+ncUnwSXeskLOt3pZ6r3PigFjYj54Mn8sXJOyqLUX6+jfG9pd6
NlHVFtnFx6hKbdUrWn/y1G5L+DJmVSsABcEgegZSSggvYtGUd2/LJVr26yWd+m+S
FpQw177iNcZX40go8NpPoCeIOamf0KkO5ObLaM7rFAxT0yE3cb+zRCuQXDWb3Mz1
0XUGhUtmvGqbXBhAMAw=
=6pHW
-----END PGP SIGNATURE-----

--xCjIimwECe6pBjLUijb26v9W5MLNgJUD9--
