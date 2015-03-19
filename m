From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Thu, 19 Mar 2015 20:54:51 +0000
Subject: Re: [patch] igb: cleanup igb_enable_mas() a bit
Message-Id: <1426798491.2577.41.camel@jtkirshe-mobl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-Sqn9tZiuM836eTE6ZE1f"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150319133129.GA15502@mwanda>
In-Reply-To: <20150319133129.GA15502@mwanda>
To: kernel-janitors@vger.kernel.org


--=-Sqn9tZiuM836eTE6ZE1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-03-19 at 16:31 +0300, Dan Carpenter wrote:
> Static checkers complain about this because we do:
>=20
>         if (!(connsw & E1000_CONNSW_SERDESD)) {
>                 ...
>         } else if (connsw & E1000_CONNSW_SERDESD) {
>                 ...
>         } else {
>                 ...
>         }
>=20
> Once you eliminate that E1000_CONNSW_SERDESD is set and not set then
> there aren't any other possibilities so the else statement is dead
> code.
>=20
> This function always returns zero so if you delete the "ret_val"
> variable, the code is shorter and more clear.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, surprised we did not see this earlier.  I have added your
patch to my queue.
--=20
git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/next-queue.git
dev-queue

--=-Sqn9tZiuM836eTE6ZE1f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJVCzebAAoJEOVv75VaS+3Oe5IP/R7Iz0Ei5ORHjNiFSJbLB0sD
4qaEo5qPmbKg0UMUl4Af6qLL4wPcoILj/n9ZI3w3BpE0ExMO7trpCMWG+fqfjOX7
CrN02wBDF/xdnwZvb4II761/k4wS3X9whJ6xJGJzCrrwgyQhYt+ZuVLNKmLpjTjh
/QVfbzFDVPA/Y95CAzBsVunqZOaxOikeg5/c8AgLXxintIrGBk2Tn9gnZ7ioTbmM
J2bD2o/vWcRVhpjqQVGyFzq/xufEmmS5v3yhNad6WGnuSD/TvreA2GfZ9AzRdfJd
q6hFCn2gVMKN+eCXqtyozqG7Op8eQ8S2jeNO4NfmJ+mkKBKZasb5e4yEZLhn+TOX
+ZYoe0LarTc2Kd+vt+mLwzWP3F6qwaXnRgiC+9gut38SbHLQe6Pfg76393NyIZUy
JwwvT8iyWaWJCmfgvArTYGtGqfbe0sUhgDJB3K+1rkw2+JDk9fNEXH8SmtfJ+6Ks
p+fq/4c6Yg2jmR7habXpNuXByYYnmEYJQ3i9ceONpMvOrlYeb5R3qbRbFZYQ0V+k
HoyJ80W5aFaqCvw37pnbNTB6M47x3e0buG8qceu01vtGiWBsvfXfh2h5ZFGeIXjO
uuH8PnuixfCDAYn8Ah6aWteRNI8d6jcVOrCRO++j1Zd2HElLCqJOuuarrH6B14qS
KEL6D9U+WEyzEfH/Lehe
=+FgC
-----END PGP SIGNATURE-----

--=-Sqn9tZiuM836eTE6ZE1f--

