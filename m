From: Pavel Machek <pavel@denx.de>
Date: Sun, 20 Sep 2020 20:51:11 +0000
Subject: Re: [PATCH] 6lowpan: Add missing locking
Message-Id: <20200920205111.GA31185@duo.ucw.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
List-Id: <kernel-janitors.vger.kernel.org>
References: <2325b986-a4ea-9aa3-40ba-702ebe9b519c@web.de>
In-Reply-To: <2325b986-a4ea-9aa3-40ba-702ebe9b519c@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Pavel Machek <pavel@denx.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, syzbot+96414aa0033c363d8458@syzkaller.appspotmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lihong Kou <koulihong@huawei.com>, Marcel Holtmann <marcel@holtmann.org>


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-09-20 16:14:22, Markus Elfring wrote:
> > I believe set_lock should be taken in exit function, too.
>=20
> * Would an imperative wording become helpful for the change description?
>=20
> * How do you think about to add the tag =E2=80=9CFixes=E2=80=9D to the co=
mmit message?

Hi,

This is the semi-friendly notice stolen from Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

								Pavel
--=20
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX2fAvwAKCRAw5/Bqldv6
8ojgAJ9etw8H04JUAZoA7SzA9c1syP1y5QCgtou+ksIF2mZDV68WLpZQ5/Chvg4=
=kOI6
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
