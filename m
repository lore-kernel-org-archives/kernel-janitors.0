From: Felipe Balbi <balbi@ti.com>
Date: Thu, 18 Oct 2012 18:03:40 +0000
Subject: Re: [balbi-usb:i2c-transferred-bytes-on-NACK 7/8] drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning:
Message-Id: <20121018180340.GD7917@arwen.pp.htv.fi>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+B+y8wtTXqdUj1xM"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121018112547.GS21995@yliu-dev.sh.intel.com>
In-Reply-To: <20121018112547.GS21995@yliu-dev.sh.intel.com>
To: kernel-janitors@vger.kernel.org

--+B+y8wtTXqdUj1xM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 18, 2012 at 08:01:45PM +0200, Datta, Shubhrajyoti wrote:
>=20
> ________________________________________
> From: Balbi, Felipe
> Sent: 18 October 2012 19:14:30
> To: Yuanhan Liu
> Cc: Datta, Shubhrajyoti; fengguang.wu@intel.com; Balbi, Felipe; kernel-ja=
nitors@vger.kernel.org
> Subject: Re: [balbi-usb:i2c-transferred-bytes-on-NACK 7/8] drivers/char/t=
pm/tpm_i2c_infineon.c:93:9: warning: initialization makes integer from poin=
ter without a cast
>=20
> Hi,
>=20
> On Thu, Oct 18, 2012 at 07:25:47PM +0800, Yuanhan Liu wrote:
> > Hi Shubhrajyoti,
> >
> > FYI, there are new compile warnings show up in
> >
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git i2c=
-transferred-bytes-on-NACK
> > head:   84461dba998a10909ba197fdbb4497e66d331edf
> > commit: ad5b920b31d68c5970b285136f4dff96612c7a4b [7/8] i2c: add 'transf=
erred' field to struct i2c_msg
> > config: m68k-allmodconfig # make ARCH=3Dm68k allmodconfig
> >
> > All warnings:
> >
> > drivers/char/tpm/tpm_i2c_infineon.c: In function 'iic_tpm_read':
> > drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning: initialization makes=
 integer from pointer without a cast [enabled by default]
> > drivers/char/tpm/tpm_i2c_infineon.c:93:9: warning: (near initialization=
 for 'msg1.transferred') [enabled by default]
> > drivers/char/tpm/tpm_i2c_infineon.c:94:9: warning: initialization makes=
 integer from pointer without a cast [enabled by default]
> > drivers/char/tpm/tpm_i2c_infineon.c:94:9: warning: (near initialization=
 for 'msg2.transferred') [enabled by default]
> > drivers/char/tpm/tpm_i2c_infineon.c: In function 'iic_tpm_write_generic=
':
> > drivers/char/tpm/tpm_i2c_infineon.c:141:9: warning: initialization make=
s integer from pointer without a cast [enabled by default]
> > drivers/char/tpm/tpm_i2c_infineon.c:141:9: warning: (near initializatio=
n for 'msg1.transferred') [enabled by default]
> >
> > vim +93 drivers/char/tpm/tpm_i2c_infineon.c
> >
> > aad628c1 Peter Huewe 2012-08-07   77   * Read len bytes from TPM regist=
er and put them into
> > aad628c1 Peter Huewe 2012-08-07   78   * buffer (little-endian format, =
i.e. first byte is put into buffer[0]).
> > aad628c1 Peter Huewe 2012-08-07   79   *
> > aad628c1 Peter Huewe 2012-08-07   80   * NOTE: TPM is big-endian for mu=
lti-byte values. Multi-byte
> > aad628c1 Peter Huewe 2012-08-07   81   * values have to be swapped.
> > aad628c1 Peter Huewe 2012-08-07   82   *
> > aad628c1 Peter Huewe 2012-08-07   83   * NOTE: We can't unfortunately u=
se the combined read/write functions
> > aad628c1 Peter Huewe 2012-08-07   84   * provided by the i2c core as th=
e TPM currently does not support the
> > aad628c1 Peter Huewe 2012-08-07   85   * repeated start condition and d=
ue to it's special requirements.
> > aad628c1 Peter Huewe 2012-08-07   86   * The i2c_smbus* functions do no=
t work for this chip.
> > aad628c1 Peter Huewe 2012-08-07   87   *
> > aad628c1 Peter Huewe 2012-08-07   88   * Return -EIO on error, 0 on suc=
cess.
> > aad628c1 Peter Huewe 2012-08-07   89   */
> > aad628c1 Peter Huewe 2012-08-07   90  static int iic_tpm_read(u8 addr, =
u8 *buffer, size_t len)
> > aad628c1 Peter Huewe 2012-08-07   91  {
> > aad628c1 Peter Huewe 2012-08-07   92
> > aad628c1 Peter Huewe 2012-08-07  @93          struct i2c_msg msg1 =3D {=
 tpm_dev.client->addr, 0, 1, &addr };
> > aad628c1 Peter Huewe 2012-08-07   94          struct i2c_msg msg2 =3D {=
 tpm_dev.client->addr, I2C_M_RD, len, buffer };
>=20
> missing C99 conversion. Shubhro, I thought you had taken care of all
> that during v3.7 merge window.
>=20
> 2 are remaining and 2 are in dimitry tree.
>=20
> This one :
>=20
>=20
>=20
> http://www.spinics.net/lists/linux-i2c/msg10129.html
>=20
> this one is acked by peter not acceped.
>=20
> posted and acked
> http://www.mail-archive.com/linux-i2c@vger.kernel.org/msg10161.html
>=20
> 2 are in dimitry branch
> http://git.kernel.org/?p=3Dlinux/kernel/git/dtor/input.git;a=3Dcommit;h=
=3D24e491c21b4e214a980a5daf2a5bc80e8c410ce6

Great, thanks a lot :-)

--=20
balbi

--+B+y8wtTXqdUj1xM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQgER8AAoJEIaOsuA1yqRE3coP/2B3zdGrFnrkC7H2Pgv1+Jue
bHRGGc1NqP28AZhtMVcGToFdQEdDzK6AbCRpd8OMqyw2kqBT1mpFSr0mJI1Fz8VY
mhpRUdUDM8EOO6PAOFrH+fRKoJ5MdKLaON7LnRh4klYHv5DhNUM3/kHkUisqZoOs
QMe5egQ4wxFVBGbWxCeFv25FLNEmcgVwPOCXq6TCnOqLw4TRk8KfKInAt0rcxmIV
e6QD4acw9Q0xdNpxpU9CZxkCH/sC9FqltHRNj2AHg2aMqGXl92FC2JaDq1POB6EO
ID73x7QfjCgHDaTl67k254IkEiXcPz5NBPJBZPztn1boCSjRyXLirnrOycym51Qg
R/F5cdhCVtJrkNIp03kTbr0KVXJDh3kLAvOxxuOZXwsuft0zjkEE/fhlN8y1QGL+
Zllw3eaWUVrNqBInatm0+UpCJMH4brcLaUy9Lif3ExU4o2WQbCWdn7Ki5iKfiNmV
8EnJIb34nUa5cJ5HAv8n1u69qWlS8C5PdiWchoZ3X5bMbtr5BZQBmJrsqtBjmcaF
CnkEn5pXBLC4+iCxznl9AMpx/hFc2bq4wrPD0HGo04LEXt4wAl2sOPYV1GLS2hdh
MfAep8zjLKbw4oHN/S898NpjkPe5Hp0izrWPxVh12bjgON2mIv0wH3hUdzAp3Mb4
SWmeqxI9d+FGnueWiUHW
=n1YB
-----END PGP SIGNATURE-----

--+B+y8wtTXqdUj1xM--
