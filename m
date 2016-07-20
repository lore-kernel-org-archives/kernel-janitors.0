From: Wolfram Sang <wsa@the-dreams.de>
Date: Wed, 20 Jul 2016 15:44:06 +0000
Subject: Re: [PATCH 2/9] staging: ks7010: Delete unnecessary assignments for buffer variables
Message-Id: <20160720154406.GB1688@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+pHx0qQiF2pBVqBT"
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <c7b39a66-bff0-b17f-c705-0220b0ae4e26@users.sourceforge.net>
In-Reply-To: <c7b39a66-bff0-b17f-c705-0220b0ae4e26@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 08:15:11PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 17 Jul 2016 13:38:46 +0200
>=20
> A few variables were assigned a null pointer despite of the detail
> that they were immediately reassigned by the following statement.
> Thus remove such unnecessary assignments.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Wolfram Sang <wsa@the-dreams.de>


--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj5xGAAoJEBQN5MwUoCm2GGkQAJKOnjY+DfJ98TofNDuzSQqG
UxsepDcpAtIehSKJ0awPGXfuX4WowFAeOIdYzHOXDdSrnW1TSIYBI3s69tHLeShr
BdK1fjN48MLWryIDeuh8Qn99Ex1dyGEtAmQnirWXVQfw5lFM70ZHcNn4Ly7+BcTD
D0podHcvbqBxTuEpaz2lNRXS94ai6dNhYB0HM8z9bbFiEq4VzEnfTZSO076PPPaR
mS+LfIHRsrNe8BEbwjXopj52Tt5iTReac1K/uNn+S01VJnW6fvka1RA+DdlT+kNp
rOOyVuRigz7R7ZOQsAsPCt5T0xM5It+LcZSsULnqCqsUlO3YsS4/2ptF3P4TVgKp
f1samYfgwH5CkqWR7neo5mZ+k4IrPqqMpHz8FIRYpAh6TA3EuiA7fBqiePx6LkZW
WZVTDaNSKLe0voc7csaM4aqv0N2EKp/Msy+ohv/g8h2FYHlwCyg0cKzFwV/WxAzw
pWYSpBgVYUmc9ewxSBDBUcBES1t9cVQoa4/p9b2b+befbHKNQQnZhGnGcG8MA17T
AgRseXp3r6FNbyXkfIzmdmmWXSn5j9oGjD2yJquwrmPBqOHy74InvIFWuLLUvcJv
lwGqcppRlu067/hZdV4Gi4yvAfd8fu8ODAo7NevcWD5sLMRDx+gqvcv4xvb08po2
QnmXj5uZpxXu5fnbKHdp
=Dcy8
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--
