From: Wolfram Sang <wsa@the-dreams.de>
Date: Wed, 20 Jul 2016 15:42:48 +0000
Subject: Re: [PATCH 1/9] staging: ks7010: Delete unnecessary checks before the function call "kfree"
Message-Id: <20160720154248.GA1688@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="IJpNTDwzlM2Ie8A6"
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
 <6f857864-aa3b-3a78-c48e-fd677d5a3492@users.sourceforge.net>
In-Reply-To: <6f857864-aa3b-3a78-c48e-fd677d5a3492@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 08:10:48PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 17 Jul 2016 13:14:57 +0200
>=20
> The kfree() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the calls is not needed.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Wolfram Sang <wsa@the-dreams.de>


--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj5v4AAoJEBQN5MwUoCm28fsP/ApOPqCQirGrrtNNHIvnuFnx
2KvtZiI+WvcJdwoVt1+YiBUm/CGqOIgvidvKYEc1Sth7oUkIIKcDvbzSxN4LfmIX
DLYePZAU2blP76m+kq43ZrCmO/spsqXZVPUiKfFvHz1ezQTMzpmGYV4MlDX5kFWI
GzOhf5+3YRdzQEk3UR51vw9AVLRTsGmRAXEBKTlYc8Bqlr5S1TVRVnpoIzLCPAE9
4ddqdIQqv9aHXm/b3Of0+dtkdyD09JgXiwXKPYkU3pEytfw6MowUZmIYfnpYBL0T
w4iqMLXVDatqHXPTtF0zk/mzg95Nl+R7seylkJfnk9RoR391UV9csDxQX1vm6L6K
ZBw/0TtjnlfLnNp3e4S8+MQHazfFqBVe0oZwBXrbxGy1FflOZWJuaw8EK9odAFN3
X1hB74+pBMuHFOYkWhcFBbcKiYBPjkfNfOyjPTMgUZVfhjfyoHZ7paDk9k6V4KkX
9tgaTLiwh2sIv+8oPM3M4TLt9h6QhYpvIDoj2haTaHOBnGG4rtsrw4Ocys5RJvoH
uDKADj7WGRgkBXOKLju4N+y5n57W49kj9Drr7ValDorCrT1xeduoEqc/xb6l238G
XeSyht5WkfHZRfzaEr1RPTYCfwc2fhWhmpyIiArn1WdVq50rhEdHs8xXXU2Zakm9
Qu4aLc90+VRhRPtoSj95
=IvdI
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
