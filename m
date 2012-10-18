From: Felipe Balbi <balbi@ti.com>
Date: Thu, 18 Oct 2012 13:44:30 +0000
Subject: Re: [balbi-usb:i2c-transferred-bytes-on-NACK 7/8] drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning:
Message-Id: <20121018134430.GA2739@arwen.pp.htv.fi>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="0OAP2g/MAC+5xKAE"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121018112547.GS21995@yliu-dev.sh.intel.com>
In-Reply-To: <20121018112547.GS21995@yliu-dev.sh.intel.com>
To: kernel-janitors@vger.kernel.org

--0OAP2g/MAC+5xKAE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 18, 2012 at 07:25:47PM +0800, Yuanhan Liu wrote:
> Hi Shubhrajyoti,
>=20
> FYI, there are new compile warnings show up in
>=20
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git i2c-t=
ransferred-bytes-on-NACK
> head:   84461dba998a10909ba197fdbb4497e66d331edf
> commit: ad5b920b31d68c5970b285136f4dff96612c7a4b [7/8] i2c: add 'transfer=
red' field to struct i2c_msg
> config: m68k-allmodconfig # make ARCH=3Dm68k allmodconfig
>=20
> All warnings:
>=20
> drivers/char/tpm/tpm_i2c_infineon.c: In function 'iic_tpm_read':
> drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning: initialization makes i=
nteger from pointer without a cast [enabled by default]
> drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning: (near initialization f=
or 'msg1.transferred') [enabled by default]
> drivers/char/tpm/tpm_i2c_infineon.c:94:9: warning: initialization makes i=
nteger from pointer without a cast [enabled by default]
> drivers/char/tpm/tpm_i2c_infineon.c:94:9: warning: (near initialization f=
or 'msg2.transferred') [enabled by default]
> drivers/char/tpm/tpm_i2c_infineon.c: In function 'iic_tpm_write_generic':
> drivers/char/tpm/tpm_i2c_infineon.c:141:9: warning: initialization makes =
integer from pointer without a cast [enabled by default]
> drivers/char/tpm/tpm_i2c_infineon.c:141:9: warning: (near initialization =
for 'msg1.transferred') [enabled by default]
>=20
> vim +93 drivers/char/tpm/tpm_i2c_infineon.c
>=20
> aad628c1 Peter Huewe 2012-08-07   77   * Read len bytes from TPM register=
 and put them into
> aad628c1 Peter Huewe 2012-08-07   78   * buffer (little-endian format, i.=
e. first byte is put into buffer[0]).
> aad628c1 Peter Huewe 2012-08-07   79   *
> aad628c1 Peter Huewe 2012-08-07   80   * NOTE: TPM is big-endian for mult=
i-byte values. Multi-byte
> aad628c1 Peter Huewe 2012-08-07   81   * values have to be swapped.
> aad628c1 Peter Huewe 2012-08-07   82   *
> aad628c1 Peter Huewe 2012-08-07   83   * NOTE: We can't unfortunately use=
 the combined read/write functions
> aad628c1 Peter Huewe 2012-08-07   84   * provided by the i2c core as the =
TPM currently does not support the
> aad628c1 Peter Huewe 2012-08-07   85   * repeated start condition and due=
 to it's special requirements.
> aad628c1 Peter Huewe 2012-08-07   86   * The i2c_smbus* functions do not =
work for this chip.
> aad628c1 Peter Huewe 2012-08-07   87   *
> aad628c1 Peter Huewe 2012-08-07   88   * Return -EIO on error, 0 on succe=
ss.
> aad628c1 Peter Huewe 2012-08-07   89   */
> aad628c1 Peter Huewe 2012-08-07   90  static int iic_tpm_read(u8 addr, u8=
 *buffer, size_t len)
> aad628c1 Peter Huewe 2012-08-07   91  {
> aad628c1 Peter Huewe 2012-08-07   92 =20
> aad628c1 Peter Huewe 2012-08-07  @93  	struct i2c_msg msg1 =3D { tpm_dev.=
client->addr, 0, 1, &addr };
> aad628c1 Peter Huewe 2012-08-07   94  	struct i2c_msg msg2 =3D { tpm_dev.=
client->addr, I2C_M_RD, len, buffer };

missing C99 conversion. Shubhro, I thought you had taken care of all
that during v3.7 merge window.

--=20
balbi

--0OAP2g/MAC+5xKAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQgAe+AAoJEIaOsuA1yqREJeAP/0QrW1LRVqnHVIfeU6gfMzGZ
ZThdUte+di15q3bCVJryEcF43ub/fA43hwJuzqzsPeC4NxNT8tmg0lEkA1UDJc2d
DUKcuooNRm7E3dOR9RE2YJAlE1SUFg0N5RlGgRL3PjN9JcZeu00P2kKb+jAMo7j9
tbYUoSZUTPkitNkYAEe7pjGh2iY/8HVztJYskywIK0vd17adgE3Og9fXYOeZcnUn
PbOruGeBgkZp0n20y/nYWfNt+mjDJh9+wJqUEBofo38yZtpwkyYMB3cx6YfgNeQE
kteK6SU4K7kSdhRfoRyNw7N9PsgUe7yBCimxFNRe9/cs+xai9SQRi4jhr0FxeYWE
x+/VYbbjJtYN6H1Th5sFEn1YVuRfGsGHgQCnk6OAsfpafbOcxquawYg//IeRcA1V
h1sZV9Ct/R1CknurNKLukaizWjlCtDQTJ+GUV8UsQCMAwrjmDIfvB7MvFy2lJUPj
G6u2CrKy4Qlt7qXm50vcebmBpfoNv0o8pP2+/M4hmRM7KH46gHqEPs/Y+mGjzuJK
aAhwN8DaBfk/vRxXD1FQMsp0oVTwnbGCFcxpNISsEHVqpfIGwwbkD6n6m7ylTRYf
taHumJNjWsWi2/onOtspp+N1V1+kcxPNrdILOPNbLQ090F8GnfgiiIZ6nUyiOR1N
n/13dBPD1aWSishIhCVC
=RF2I
-----END PGP SIGNATURE-----

--0OAP2g/MAC+5xKAE--
