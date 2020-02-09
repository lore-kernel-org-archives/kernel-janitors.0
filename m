From: Felipe Balbi <balbi@kernel.org>
Date: Sun, 09 Feb 2020 17:54:03 +0000
Subject: Re: [PATCH] usb: dwc3: debug: remove redundant call to strlen
Message-Id: <87pnen3av8.fsf@kernel.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200208162508.29336-1-colin.king@canonical.com>
In-Reply-To: <20200208162508.29336-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The call to strlen is redundant since the return value is assigned
> to variable len but not subsequently used. Remove the redundant
> call.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/dwc3/debug.h | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/usb/dwc3/debug.h b/drivers/usb/dwc3/debug.h
> index e56beb9d1e36..ee964352c8e2 100644
> --- a/drivers/usb/dwc3/debug.h
> +++ b/drivers/usb/dwc3/debug.h
> @@ -296,8 +296,6 @@ static inline const char *dwc3_ep_event_string(char *=
str, size_t size,
>  				status & DEPEVT_STATUS_TRANSFER_ACTIVE ?
>  				" (Active)" : " (Not Active)");
>=20=20
> -		len =3D strlen(str);
> -

looking at the code here. The problem is elsewhere:

| case DWC3_DEPEVT_XFERNOTREADY:
| 	len =3D strlen(str);
| 	snprintf(str + len, size - len, "Transfer Not Ready [%d]%s",
| 			event->parameters,
| 			status & DEPEVT_STATUS_TRANSFER_ACTIVE ?
| 			" (Active)" : " (Not Active)");
|
| 	len =3D strlen(str);
|
| 	/* Control Endpoints */
| 	if (epnum <=3D 1) {
| 		int phase =3D DEPEVT_STATUS_CONTROL_PHASE(event->status);
| 		switch (phase) {
| 		case DEPEVT_STATUS_CONTROL_DATA:
| 			snprintf(str + ret, size - ret,
| 					" [Data Phase]");
| 			break;
| 		case DEPEVT_STATUS_CONTROL_STATUS:
| 			snprintf(str + ret, size - ret,
| 					" [Status Phase]");

these two should use str + len and size - len. However, a better fix
would be drop the usage of strlen() and just use the return value from
snprintf().

Do you want to produce that patch, instead? It could be two patches:

	1. replace ret with len in these two cases (a bug fix, possibly
	        Cc stable)
        2. drop usage of strlen() in the entire function (a new feature,
	        for v5.7

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl5ARz0ACgkQzL64meEa
mQYgmw/9EE5pVmtUrQ8lNzsRD1D74sigwdOsgAiv2KzGlsAo6V//uG7pj7HDevKs
PbGaHd1Z4wChEWK4SeNiGpt/Ti6i0jWJjm444SfOAzTaf9l+PChxW779Sevtpamh
kmapC8Kcu6+hDdudSXAahPvDy7cImv9ZRZwUvZCspIQgVz21+5MqZSGFv1Uzkp5M
0T/mGQcFRtdBDJzZvZxV/7Fk/pwAEtFGga324kvqJVu/156U9vgQOF4mhdxFFXrD
wcwIRQRr8oEHf+h/e/m1XI6GLlXsiCGWtPwd1C93GyS5GkTi7pcovxwXmhIbwwap
TzpsRWt+iFldtzrBgpEGrBtnLf+4T8jLGa3x6CWWmLe7f5jIdznd0DUkPn3ykSjR
LKVJ0vw1iASh16E4ayD7mtwk6ocxSSkq4mxmSebJH5xDzKlfPC0Igtd/gfmKDyku
/PRzMXi4HkkVO6Q6P8B1f7dKX2Oj2r6z7+Rgb5smb/Hh6E5TSFnf20SgdEYCdz22
VYzM6hR6Z39MQW+Vi2Ag72PYN0azhgXvqahRvf72Rov1cbtlT5fsUYJPN3W+S1MJ
CUA7/Y2vPulVTCYSUsq4MG+mK2d9fEgQ1U66Ysk6Q3FSJoRgAHSoSmaVp5V4GuX+
IRhwRji+3TaLqQo65jdhuvCxMXTjQ/sldiEws5trBCGwHC2I92U=
=AtVg
-----END PGP SIGNATURE-----
--=-=-=--
