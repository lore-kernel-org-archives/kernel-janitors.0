From: Joe Perches <joe@perches.com>
Date: Sun, 20 Dec 2015 19:05:55 +0000
Subject: Re: [patch -next] ath9k: fix ath9k_hw_nvram_check_version()
Message-Id: <1450638355.3430.34.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151219105919.GB3749@mwanda>
	 <1450637228.3430.30.camel@perches.com>
	 <alpine.DEB.2.02.1512201959090.2055@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1512201959090.2055@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

On Sun, 2015-12-20 at 20:00 +0100, Julia Lawall wrote:
> On Sun, 20 Dec 2015, Joe Perches wrote:
>=20
> > On Sat, 2015-12-19 at 13:59 +0300, Dan Carpenter wrote:
> > > There is a type bug so it always returns success.
> >=A0
> > How many false positives do you have to sift
> > through to find this sort of error?
>=20
> The return type is thoughtfully bool, so it should be easy in this case.=
=A0=A0
> The function has a return -EINVAL and a return true, so even without the=
=A0
> return type it would be locally apparent that there is an inconsistency.

True, -EINVAL is a non-bool constant, but
bool returns can be a variable int.

Dan, was the check any constant non-bool?

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
