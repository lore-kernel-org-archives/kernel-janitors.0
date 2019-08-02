From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Fri, 02 Aug 2019 12:12:29 +0000
Subject: Re: [PATCH][next] can: kvaser_pciefd: remove redundant negative check on trigger
Message-Id: <34bd981c-0bc1-6eba-9663-f8e8ced2f72e@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="DXmJXbu7rk1HGraFlSw9WGVOQYHPuvE59"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190725112509.1075-1-colin.king@canonical.com>
In-Reply-To: <20190725112509.1075-1-colin.king@canonical.com>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DXmJXbu7rk1HGraFlSw9WGVOQYHPuvE59
Content-Type: multipart/mixed; boundary="ZQh91bgBZe0YjWdLIWZvz7nEmgMpEJrXC";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Colin King <colin.king@canonical.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-can@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
 Henning Colliander <henning.colliander@evidente.se>,
 Jimmy Assarsson <extja@kvaser.com>, Christer Beskow <chbe@kvaser.com>,
 walter harms <wharms@bfs.de>
Message-ID: <34bd981c-0bc1-6eba-9663-f8e8ced2f72e@pengutronix.de>
Subject: Re: [PATCH][next] can: kvaser_pciefd: remove redundant negative check
 on trigger
References: <20190725112509.1075-1-colin.king@canonical.com>
 <954ea3c6-3a2d-ee4e-c4c8-a49358d569b6@pengutronix.de>
In-Reply-To: <954ea3c6-3a2d-ee4e-c4c8-a49358d569b6@pengutronix.de>

--ZQh91bgBZe0YjWdLIWZvz7nEmgMpEJrXC
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 8/2/19 2:07 PM, Marc Kleine-Budde wrote:
> Adding the Author(s) to Cc.
>=20
> On 7/25/19 1:25 PM, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The check to see if trigger is less than zero is always false, trigger=

>> is always in the range 0..255.  Hence the check is redundant and can
>> be removed.
>>
>> Addresses-Coverity: ("Logically dead code")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/net/can/kvaser_pciefd.c | 3 ---
>>  1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/net/can/kvaser_pciefd.c b/drivers/net/can/kvaser_=
pciefd.c
>> index 3af747cbbde4..68e00aad0810 100644
>> --- a/drivers/net/can/kvaser_pciefd.c
>> +++ b/drivers/net/can/kvaser_pciefd.c
>> @@ -652,9 +652,6 @@ static void kvaser_pciefd_pwm_stop(struct kvaser_p=
ciefd_can *can)
>>  	top =3D (pwm_ctrl >> KVASER_PCIEFD_KCAN_PWM_TOP_SHIFT) & 0xff;
>> =20
>>  	trigger =3D (100 * top + 50) / 100;

As Walter pointed out the above code makes no sense in the first place.

>> -	if (trigger < 0)
>> -		trigger =3D 0;
>> -

Can someone have a deeper look at this code section and decide what to
do with this finding.

>>  	pwm_ctrl =3D trigger & 0xff;
>>  	pwm_ctrl |=3D (top & 0xff) << KVASER_PCIEFD_KCAN_PWM_TOP_SHIFT;
>>  	iowrite32(pwm_ctrl, can->reg_base + KVASER_PCIEFD_KCAN_PWM_REG);
>>

regards,
Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--ZQh91bgBZe0YjWdLIWZvz7nEmgMpEJrXC--

--DXmJXbu7rk1HGraFlSw9WGVOQYHPuvE59
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEmvEkXzgOfc881GuFWsYho5HknSAFAl1EKK0ACgkQWsYho5Hk
nSARwQgAj1game82YoBoUt3nIrj3r+el5e5N/67rPixsLJ3DbiYbp3/XzwktMbWw
3/PDKPQXo/Y3/0LmP7Lk71wQkResvqtJvK2k4MIt+PxhZfQ2QW+kObpzWYcXQzRG
I24G8hAA3o5TE5PwdZr5TH6UZ9Gx4KAHsqqmBaopT6q0um3nANZ6TZAwgKI5OR5W
Y90EB5wCwWLUzY4o+R1ndmjm5yQZMJNmXu5quWMi53TPaNSTCTipefUTAU9RgzqT
JBQvZMXOM9L+VtUmnx+hnx/fMTNbkWUjHAkQ64lSI6I+cPNGDZR9zxxGLsOx1Ee3
u7khuOqfAjLgivF50ioWz82mTwuv6g==
=03/D
-----END PGP SIGNATURE-----

--DXmJXbu7rk1HGraFlSw9WGVOQYHPuvE59--
