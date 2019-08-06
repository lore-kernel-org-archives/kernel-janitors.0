From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 06 Aug 2019 06:46:31 +0000
Subject: Re: [PATCH][next] can: kvaser_pciefd: remove redundant negative check on trigger
Message-Id: <20686c0c-9b34-8bf1-16c1-8a2c85b6b41f@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="5p760AgAqtcmOzHfHAj0L7PFh8CTMy52S"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190725112509.1075-1-colin.king@canonical.com>
In-Reply-To: <20190725112509.1075-1-colin.king@canonical.com>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5p760AgAqtcmOzHfHAj0L7PFh8CTMy52S
Content-Type: multipart/mixed; boundary="bydlHlsBjxc4HKTGFiffadfiKV1kklCq1";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Christer Beskow <chbe@kvaser.com>, Colin King <colin.king@canonical.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-can@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
 Henning Colliander <henning.colliander@evidente.se>,
 walter harms <wharms@bfs.de>
Message-ID: <20686c0c-9b34-8bf1-16c1-8a2c85b6b41f@pengutronix.de>
Subject: Re: [PATCH][next] can: kvaser_pciefd: remove redundant negative check
 on trigger
References: <20190725112509.1075-1-colin.king@canonical.com>
 <954ea3c6-3a2d-ee4e-c4c8-a49358d569b6@pengutronix.de>
 <34bd981c-0bc1-6eba-9663-f8e8ced2f72e@pengutronix.de>
 <db550f33-fac6-5e2b-c623-3587976e2d51@kvaser.com>
 <c45f56e6-9448-7023-8eca-703cb1c5050e@kvaser.com>
In-Reply-To: <c45f56e6-9448-7023-8eca-703cb1c5050e@kvaser.com>

--bydlHlsBjxc4HKTGFiffadfiKV1kklCq1
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 8/6/19 8:43 AM, Christer Beskow wrote:
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pwm_ctrl =3D trigger & 0xff;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pwm_ctrl |=3D (top & 0xff) << KVASER=
_PCIEFD_KCAN_PWM_TOP_SHIFT;
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iowrite32(pwm_ctrl, can->reg_base + =
KVASER_PCIEFD_KCAN_PWM_REG);
>>>>>
> To set the duty cycle to zero (i.e. pwm_stop), the trigger value shall =

> be equal to the top value.
>=20
> This is achieved by reading the value of the top bit field from the pwm=
=20
> register and then writing back this value to the trigger and top bit=20
> fields.
>=20
> The current code is, as you all pointed out, a bit cumbersome. I will=20
> send a new patch in a new thread.

Thanks. Please include this description in the patch description.

regards,
Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--bydlHlsBjxc4HKTGFiffadfiKV1kklCq1--

--5p760AgAqtcmOzHfHAj0L7PFh8CTMy52S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEmvEkXzgOfc881GuFWsYho5HknSAFAl1JIkgACgkQWsYho5Hk
nSAt2gf+Pb0nTdSnnrG/FOkFpPlQC/d1TAj93tCKhDIHDc+MI8cX+OM9R5Q3qkPx
LiP2QoXRYzVbJvMXDiNnN2IRWnhGX9uqBasTSXMKWPqd5eqI+EKwIlYQdfESHNvP
+xa+A5E9MkRCSXbDDA3Yp/cqIjqKpUV1dqTb9a8Npcw78AOOYqbMKm0+CxfhDfxs
eXFXFgddxHoqdp10qayIqPWitx3w425Mwxk6LM+iFP+HvUcrN5KFDeJLXORgB8N+
MgYF7uhUKMXkdJZ6KkGuKywxN1oMLy3sbPI07V+CrsIIsIoQaBrFNr4fPJJOH3kx
hfBbHHavTXM1DDq50K0J8/jjUQ29pA==
=Etnb
-----END PGP SIGNATURE-----

--5p760AgAqtcmOzHfHAj0L7PFh8CTMy52S--
