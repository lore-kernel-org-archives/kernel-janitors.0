From: Benson Leung <bleung@google.com>
Date: Sat, 16 Dec 2017 05:13:50 +0000
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: remove redundant pointer request
Message-Id: <20171216051350.GC79455@decatoncale.mtv.corp.google.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="wxDdMuZNg1r63Hyj"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171031102747.20154-1-colin.king@canonical.com>
In-Reply-To: <20171031102747.20154-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Benson Leung <bleung@chromium.org>, Olof Johansson <olof@lixom.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Colin,

On Tue, Oct 31, 2017 at 10:27:47AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Pointer request is being assigned but never used, so remove it. Cleans
> up the clang warning:
>=20
> drivers/platform/chrome/cros_ec_lpc.c:68:2: warning: Value stored to
> 'request' is never read
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for the patch. Sorry for the delay. Applied for v4.16.

Thanks,
Benson

> ---
>  drivers/platform/chrome/cros_ec_lpc.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_lpc.c b/drivers/platform/chr=
ome/cros_ec_lpc.c
> index 1baf720faf69..87e9747d229a 100644
> --- a/drivers/platform/chrome/cros_ec_lpc.c
> +++ b/drivers/platform/chrome/cros_ec_lpc.c
> @@ -54,7 +54,6 @@ static int ec_response_timed_out(void)
>  static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *ec,
>  				struct cros_ec_command *msg)
>  {
> -	struct ec_host_request *request;
>  	struct ec_host_response response;
>  	u8 sum;
>  	int ret =3D 0;
> @@ -65,8 +64,6 @@ static int cros_ec_pkt_xfer_lpc(struct cros_ec_device *=
ec,
>  	/* Write buffer */
>  	cros_ec_lpc_write_bytes(EC_LPC_ADDR_HOST_PACKET, ret, ec->dout);
> =20
> -	request =3D (struct ec_host_request *)ec->dout;
> -
>  	/* Here we go */
>  	sum =3D EC_COMMAND_PROTOCOL_3;
>  	cros_ec_lpc_write_bytes(EC_LPC_ADDR_HOST_CMD, 1, &sum);
> --=20
> 2.14.1
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJaNKuOAAoJEB8J9XsKL+ZYBcsQALwAEWYLcyK+eLsCZRb7Ke6P
JNC59yXLxPP9alWarpopDu42SOyZMitnUhz0Bgf0hzdO87yYpeLVp7cBEFPY+DU9
cFGD79rK6iv/upGu78X63/EUrSWaHrKg2ZLvm2qrs6565dTG3CrgllZEh7LrmbzB
XGwFi6Xld1t5XwB/qhAHu9zvMrmZkr5dX3/heUE3ocOt/u3f/Mpnsrk0QuDmtMH7
FAWZPr2BEBuJV5ZPlF8NMjR4E3WQkM/9hO30siabkySF3NPRG0neDPvzJ9kufUqn
6uykgQDkDM+JYJHW/1Z1QQE0Hv8FvWcls2hcNpOvwvE3RGo0k8dISyqaWs9fzs7m
KjBL7C1mvknqzzxqNqzvsFWtgKNXQB24T6MCYvtjy1IgV1SmZln54cuiOjETGtps
LYQwf4Glad4+IpxXH/9kq6v9chu0RGN4sQUtg/xlhMXKQ2VvPqQlMoBX1cyZPTu5
cUcCbfjBUQpe7aIbQuPBzjtjCCFo+1UEnA2x+tI4Qwho7C6bBbbYdrw6x+WrCGgP
5+mDRpbRm5Js7tJj42uxfvJ7p5KQLy7YI/5vAkPreTm4cGAsYhOnqftA6PR/QM50
VzNVpodxqzyWWmd/Gvw2GO4f6Uv53GlOelDmx0ZaKP9BMC5aLgoJcg++A68q0Pwz
Re8eDFS9DKL47i+ugu0i
=0vjR
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
