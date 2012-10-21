From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sun, 21 Oct 2012 14:19:11 +0000
Subject: Re: [jdelvare-staging:i2c-for-linus 9/15]  drivers/input/keyboard/adp5588-keys.c:52:19: error: field
Message-Id: <20121022011911.ac6eff60624ed282b8d0231e@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Signature=_Mon__22_Oct_2012_01_19_11_+1100_=FH12yeDSehIzHCz"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121009092343.7572fb53@endymion.delvare>
In-Reply-To: <20121009092343.7572fb53@endymion.delvare>
To: kernel-janitors@vger.kernel.org

--Signature=_Mon__22_Oct_2012_01_19_11_+1100_=FH12yeDSehIzHCz
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

On Sun, 21 Oct 2012 14:16:59 +0200 Jean Delvare <khali@linux-fr.org> wrote:
>
> On Sun, 21 Oct 2012 09:48:49 +0800, Fengguang Wu wrote:
> > On Tue, Oct 16, 2012 at 09:19:41AM +0200, Jean Delvare wrote:
> > > I sent you a patch yesterday which should fix the issue:
> > > http://khali.linux-fr.org/devel/linux-3/jdelvare-i2c/i2c-i801-02-fix-=
gpiolib-dependency.patch
> > > It's in linux-next already. Can you please test it and confirm it does
> > > fix the issue?
> >=20
> > Hi Jean, I just sent you another report. I found that it can still be
> > reproduced in upstream 3.7-rc2 and linux-next 20121019.
>=20
> It turns out that linux-next no longer seems to include my i2c patches.
> Stephen, can you please check?

I haven't changed anything about the i2c tree.  I fetch a quilt series
from http://khali.linux-fr.org/devel/linux-3/jdelvare-i2c/ .  The last
change I have seen was on October 16 (my time) and the series contained
only one patch for linux-next: i2c-move-i2c-stub.patch .

I just refetched it and the only change was to now be based on v3.7-rc2.
Do you have your NEXT_PATCHES_START/END markers in the right place?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Mon__22_Oct_2012_01_19_11_+1100_=FH12yeDSehIzHCz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJQhARfAAoJEECxmPOUX5FEehwP/RHXHqodPwzdabCfATHWYP5g
mo0/byU+LgH3CIp3ookLJoUyU87pdTEQXNrdz+bLkbWNrzDCQvci0E5C8JwTbk7x
AUr7iz1W0lfrVbcIq9jwMLpM30F+19i6zL5m0MmO3TuvHewxgpmuN7wPLiX+OPt1
txliEi50dbiYDa/iGb9zXm8O2gZyrwzZK3u6n5zC5wLqWwasgaTQsg26728fpJXO
jERYwvBepjGnih27h2LIe/SKfbaxpRbOEFItrRlOEBotCPyJjDqsHVMe6rI7DyA3
RjWZr2SJoqaREKRlOaUlf9ifyXtA6x7qH1GU9us8+a19ScLEdo3ZhNO0u0QrssbW
fLQ+X5bw5qta/Ae9dbADh67ly1R9Oakgf+ytUSg9VBQZtIZfL9MWI/YB2Rxi8yD3
YLdkeKgnkf/zrScrceI26Fc29tUk35nQfRWy60k6JmjmLhPD6e+HonyoeLqxnrvs
vl9R1CfqDcDmEQhrs3A1QQprwlbaRonNPmVLto9yY6UZ4qTQ8G+5b3Ng+5RAc1/Q
m48M2YfwCKn0CQU/exdUDW0qcTuE4FI1ubX7zsmJzlvUEfVPom7b/YteZmI8ufMm
Q5fWxgbu8ms3tmwZKf2b7XVLt0C34s2/MdtNcwmMi1JMirKvsDCbgF+5xluhMcUR
r/+0oW9AGUDTkx6oiHNU
=z4kD
-----END PGP SIGNATURE-----

--Signature=_Mon__22_Oct_2012_01_19_11_+1100_=FH12yeDSehIzHCz--
