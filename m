From: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 30 Apr 2020 14:10:50 +0000
Subject: Re: [PATCH v2] i2c: i2c-amd-mp2-pci: Fix Oops in amd_mp2_pci_init() error handling
Message-Id: <20200430141050.GB3355@ninjato>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="9zSXsLTf0vkW971A"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAC_JBqofuyRiSmK0mFqVLaY=5k9MYmjGaVmggx2dn_YjN8VOmw@mail.gmail.com>
 <20190910134242.GA6620@mwanda>
In-Reply-To: <20190910134242.GA6620@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Elie Morisse <syniurge@gmail.com>, Nehal Shah <nehal-bakulchandra.shah@amd.com>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org


--9zSXsLTf0vkW971A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2019 at 04:42:42PM +0300, Dan Carpenter wrote:
> The problem is that we dereference "privdata->pci_dev" when we print
> the error messages in amd_mp2_pci_init():
>=20
> 	dev_err(ndev_dev(privdata), "Failed to enable MP2 PCI device\n");
> 		^^^^^^^^^^^^^^^^^
>=20
> Fixes: 529766e0a011 ("i2c: Add drivers for the AMD PCIe MP2 I2C controlle=
r")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to for-current, thanks!

Elie, Nehal, Shyam, are you still there to review patches for this
driver?


--9zSXsLTf0vkW971A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6q3GoACgkQFA3kzBSg
Kbb3Ww/+IR1Q3p2H6vZjfVbP/E4riOWYHlKhuDWDgmMPjRtep4KFmwo7swfQXwmg
hMZQxtBq8TiTubh0E893JCCeGoIt9ZA2Mq1tkYBDNc7Ad3yjQu81edCmXHkMxsgW
RRnCjK+6ssxyLeXh+fZhTDCUyESJpmwRTsUOmisWRiE2RJfmWxY+5YVhJ/IHDaBH
rKNSsDPYza6EkusCoztaTaw3A7f4gfKqsRv03mBA1WuXE1mG/rZgxhYV2zT9eGtU
ra6FPdWs6MCGx4OdkqqlofHhsQrZUtTjvT+7baLAZRnY8COxFoutNr1S3vq6GiGo
0BIS5dd6U1CCiWulK7glHfGI93Lufo5KZ58mm74rF9NvjBRcNt302ZQRrGlb/R2a
hYcFV5Qyp65glytBRsNgN8Ua2IeTC2tMY/PJBj/K9DvMspDB8G97nERvrVBB82R8
JMMxbSryHnvD3jsl6bD/BMh91in3VfTPecaB1DLWnendtRU//bPeD49rCSmN0lC8
/FBdTfYvPorMG2aAGyo3vusL1LeM7o1mVbyH1bPrSdErvDXg1z1ktbL8uxQWKtL8
NaSh1QsgNzsYfZIc3Jb9TCUTHGxW8uno0fw7zf7i4MK+vu3Yljrzkf+nbsDv7XLz
iiFTApTilMxmACRANgA3yOo/kzqMUViKZ8jUzrKPTexjLdyLVXo=
=2Kcc
-----END PGP SIGNATURE-----

--9zSXsLTf0vkW971A--
