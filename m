From: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 11 Aug 2016 07:05:02 +0000
Subject: Re: staging: ks7010: Replace three printk() calls by pr_err()
Message-Id: <20160811070502.GA1665@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <901acc3c-ff1b-6f0c-b744-2bfb36de18d8@users.sourceforge.net>
 <1468787163.1900.1.camel@perches.com>
 <20160720155500.GG1688@katana>
 <5911a2e6-6862-7b72-b69a-dcc32658b85b@users.sourceforge.net>
In-Reply-To: <5911a2e6-6862-7b72-b69a-dcc32658b85b@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 09:41:37PM +0200, SF Markus Elfring wrote:
> >> Please and and use pr_fmt
> >=20
> > Can't we use dev_* on the SDIO device?
>=20
> How should a connection be constructed from the data structure "sdio_devi=
ce_id"
> to the corresponding device information for such an use case?

What did you try so far?


--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXrCOeAAoJEBQN5MwUoCm2CJgQAJxvyDjHA5kIkK/HT3XYeXCh
x8KF3OieMNy+6qUYPQ9LgKkRngLhYAN2uZPDxzT9cMLtc4w9OFK+PYjXXocNo7xy
//UnGH4OCCmFXssSypAPM5C6vZ8qzRYz4T+zOBFudz9dTn/hZRad5iR8kX2yenCO
dSt3TfjCZmLMN1ToPSDRtqMKEjXpoIQeFg61oDHhJzP8X4sAUoPjBOoM4h7eTRr/
3dZmf43gMNNo1EgSovGLDO9uk4nbrDtyXEz5iFR6SfuuRKsBOGhhBCY36xP3+au+
BqQVFfuI3DTY0x7Ej/RxWZiNC7JIR4MIl8abXntllmDtwBvq17X/UVVrJegCHRsR
srhbFPSmceybfPrxW3ksc1+7P77J4KlrYNEU7vaJSa/0ctlvXrMC1hUQn0NJEnOe
24EahxzGpczj42DGQWZt80/Iu7svvrvyVRZ3XHqmvzRm+Dd1lMp0BdWBYl9L6vVM
3lng0FJ0aLMIduRoE9T2T1gfM/arSUHec5b2Lgpl/KitgqfwLJx8OjGKO3/TuOVO
m6f6T6uphvbF03aF7+NLmOpQupPKizMJcGx9tArWzMB9kbqavWI+6zAnHvJO/4EO
X4kLBowGk9HWs5ZRCBo4/G3EPxF+gN5xTuGbCAP+Fv8QpxyK2vrDoG8kyMNQviu3
8rE3wQtntnkIgIXUhqxN
=NLYf
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
