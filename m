From: Wolfram Sang <wsa@the-dreams.de>
Date: Fri, 22 Jul 2016 07:42:28 +0000
Subject: Re: staging: ks7010: Return directly after a failed kmalloc()
Message-Id: <20160722074228.GI1605@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="byLs0wutDcxFdwtm"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <3aa380a9-afe6-6dc8-7533-6747afeb1bdc@users.sourceforge.net>
 <alpine.DEB.2.10.1607172057500.3177@hadrien>
 <20160720154756.GC1688@katana>
 <2071ae3b-9878-c798-6ead-897d1dd0d116@users.sourceforge.net>
 <20160721062543.GA1664@katana>
 <05ce8907-e899-cfea-7e42-a20a0113aa19@users.sourceforge.net>
In-Reply-To: <05ce8907-e899-cfea-7e42-a20a0113aa19@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--byLs0wutDcxFdwtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 22, 2016 at 09:36:53AM +0200, SF Markus Elfring wrote:
> >> I guess that further clarification might be needed for affected
> >> implementation details.
> >=20
> > That's OK, too.
> >=20
> > Acked-by: Wolfram Sang <wsa@the-dreams.de>
>=20
> Does this acknowledgement include also the acceptance for
> the suggested change around calls of the functions "sdio_claim_host"
> and "sdio_release_host" within the implementation of the
> function "ks7010_upload_firmware"?

Likely. Send a patch and we will see.


--byLs0wutDcxFdwtm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkc5kAAoJEBQN5MwUoCm2gbEP/0Ub0gQigUCKrf5+6rKkdql0
66TWBClOlE1ey+8adBWMe3tvT1fPDQxaIr90sRVNcv7z3iObtivGKzacIil9ljyp
ELYZzkX/TAGOhCO4nkROWscmsn8UT5eHjvFeXd7XdS77STWMDqfwlZQuZeiy9ajQ
EGOEgruzW//g/2pAQrXbSGqgVlcBU8GpaMxDcDhQiEqMcbVJL8JkqPwFw35cJrR6
ekVlRSe2iOo8ichRmifgjyVUNzFFZyjwoaSkBvt2+7HaGfUPJhSPVb82LZfvTP26
8JaD7cRT/UqGfbHPub6d395BOWj6ewaHF5boF8dHGSmH4blQziEMZYLi75kNfXzh
6ZThgpZTjeKSGyfpXqnUQWue+nmqXY6SZ8xq9EaeFMOQQg65Ud5ZU2OYj89qFyks
kKfrvpQGiVHyEoyJ7lQh64zKV99eXouB17X9kdo1PMdpbbI+4lhKzo3LopAOCjC+
UjM1MXCPhDa9SklZ9mkyxp9y27aTFjB2r+HViyoX3Y5L1WKmMbkY6yU7QgB5OF1x
IRpNmlWk/6kOpfs9UAwR2bAk3FEQ1sGAzW1lNUYkNWNNe8zwkpyGWXMIkQLepZsF
KZ98PeVd6BCdFOfTYWKRZmLd5YJ6a43jgrIPHKwsmwP/mPNGNO8p401yHmAryyiH
LHkJ/gMlyW5HOkOwgDir
=mh3y
-----END PGP SIGNATURE-----

--byLs0wutDcxFdwtm--
