From: William Breathitt Gray <vilhelm.gray@gmail.com>
Date: Mon, 27 Jul 2020 15:12:18 +0000
Subject: Re: [PATCH][next] counter: microchip-tcb-capture: remove ATMEL_TC_ETRGEDG_NONE bit check
Message-Id: <20200727151218.GB4636@shinobu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="SkvwRMAIpAhPCcCJ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727140600.112562-1-colin.king@canonical.com>
In-Reply-To: <20200727140600.112562-1-colin.king@canonical.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, Colin King <colin.king@canonical.com>
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 03:06:00PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The macro ATMEL_TC_ETRGEDG_NONE is defined as 0 << 8 which is zero and
> hence the check cmr & ATMEL_TC_ETRGEDG_NONE can never be true. Since
> *action is already assigned MCHP_TC_SYNAPSE_ACTION_NONE then this check
> and set is redundant dead code and can be removed.
>=20
> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/counter/microchip-tcb-capture.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/mi=
crochip-tcb-capture.c
> index f7b7743ddb94..119640d6d6ab 100644
> --- a/drivers/counter/microchip-tcb-capture.c
> +++ b/drivers/counter/microchip-tcb-capture.c
> @@ -185,9 +185,7 @@ static int mchp_tc_count_action_get(struct counter_de=
vice *counter,
> =20
>  	*action =3D MCHP_TC_SYNAPSE_ACTION_NONE;
> =20
> -	if (cmr & ATMEL_TC_ETRGEDG_NONE)
> -		*action =3D MCHP_TC_SYNAPSE_ACTION_NONE;
> -	else if (cmr & ATMEL_TC_ETRGEDG_RISING)
> +	if (cmr & ATMEL_TC_ETRGEDG_RISING)
>  		*action =3D MCHP_TC_SYNAPSE_ACTION_RISING_EDGE;
>  	else if (cmr & ATMEL_TC_ETRGEDG_FALLING)
>  		*action =3D MCHP_TC_SYNAPSE_ACTION_FALLING_EDGE;
> --=20
> 2.27.0

The CMR value should be explictly checked for an ATMEL_TC_ETRGEDG_NONE
state; this code shouldn't default to a value, but rather return an
error if no valid can be determined.

I think this would be better implemented as a switch statement instead,
with a default case that returns such an error code.

William Breathitt Gray

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8e7tIACgkQhvpINdm7
VJI/rQ/9GVUNrwXP6cEnZ8x/0QRBrTI2+5bpLlNR8Ry19oHOaOQ9YrEYHPZpH2Er
oQMIifA4RhdRhAfK+MKB2AKnVEPQNo9js5P1t9ElJiWZz2rY/s/+HzBLTsgC/zKQ
srLyiPvLAmzBrqle48n0f8k+Cbk3jzSnaUwO5rra4x9l1LsZ6HJd4zp6Z2zrJJjJ
DaFh/H255+LAPFw2yHRvcEMOtddYb9a2rzQit4sWm3KyoJdVB5RgfkzfDc3VtOgp
d0A8h3F6n3kVbpjQsd/09wyIASCNNQ0iDO0oxyBz8xjrxWBgL2lEV+4drFXospDV
nTZuUoKYQ3fhBbMbqjZ0UMc8OiGk2gl+5XXr5Z2arhg0OO0yJdfLlh0utoincYB9
oPrO633Kp9JpSQUbfUdTubmSIbOfxB53kSJ0IJwFyZLf58DotYPhCRql+HnvxC+0
rnnm2gjc0tD9UdLFjSIVZ/51S1Guc9/Xut1dMkhZKFPcTc8rvqHZ4tNMCOAH5q6P
9mip7wQ3+If01vXM/ILQInGErkwwT8frthe94QjjCuWiUui9GReK6AVdiBIqzF9w
Xxvv58KRj3eQdU3gDzJjyCq1lANA4lnoyA439iIuSwSEMTipyvTWmTnWN2xV70Vg
ozrbA/SubCzfH6tWSNg2Bu5U74gB6j3Z8A0fZtqkvRQ2xW+lZF8=
=2+lp
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--
