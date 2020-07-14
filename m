From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Tue, 14 Jul 2020 14:25:09 +0000
Subject: [PATCH] decnet: dn_dev: Remove an unnecessary label.
Message-Id: <20200714141309.GA3184@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zYM0uCDKw75PZbzx"
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.22.394.2007141615490.2355@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2007141615490.2355@hadrien>
To: davem@davemloft.net, kuba@kernel.org
Cc: linux-decnet-user@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Remove the unnecessary label from dn_dev_ioctl() and make its error
handling simpler to read.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
 net/decnet/dn_dev.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/net/decnet/dn_dev.c b/net/decnet/dn_dev.c
index 65abcf1b3210..64901bb9f314 100644
--- a/net/decnet/dn_dev.c
+++ b/net/decnet/dn_dev.c
@@ -462,7 +462,9 @@ int dn_dev_ioctl(unsigned int cmd, void __user *arg)
 	switch (cmd) {
 	case SIOCGIFADDR:
 		*((__le16 *)sdn->sdn_nodeaddr) =3D ifa->ifa_local;
-		goto rarok;
+		if (copy_to_user(arg, ifr, DN_IFREQ_SIZE))
+			ret =3D -EFAULT;
+			break;
=20
 	case SIOCSIFADDR:
 		if (!ifa) {
@@ -485,10 +487,6 @@ int dn_dev_ioctl(unsigned int cmd, void __user *arg)
 	rtnl_unlock();
=20
 	return ret;
-rarok:
-	if (copy_to_user(arg, ifr, DN_IFREQ_SIZE))
-		ret =3D -EFAULT;
-	goto done;
 }
=20
 struct net_device *dn_dev_get_default(void)
--=20
2.17.1


--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8NvXQACgkQ+gRsbIfe
744sDA//bLkioTnZkkrrA1VGJtzPqwikbMv98ftgr6GTcZ5/FJcG3ZEq64SeMcY6
pWUhP5fFnIm4tBcaTsio3K9jQ5eLYi5KSZ36kJToxWihHt8lts2GdY9pQHe1IyOU
H/pHNMc6Y5Mqugvzn8mZF0DcoWFjyOAicEUGDHEMBEk4rFP3MS60aad1V3JQ152u
2RJm1rMHc3C8HbGTIA7/vnwNeH7aDmM8Giz7kK0IkeR+3ldRYswCniPKmoJh9Teq
4kdwAlaYcgiorYhG1ad/wwOoqPB5SeCuMHq/tgNl/y+8dr+MoiuHuoq85LS8Hp9t
PlcbjgTyUCde+jHqsWLB60OvVD4OgtHQOlrQEjI9BuTsRoApe/pGnsR7T2aLo+3I
Zv5+6nNImAWqIDvQBDIGyuO/2l+2JtVujZTswYMN/O47dqAs0jRhDWfT4Tgi76pF
gCMJWOqd1bjEqSjPwX158WEsapaEsdZJbT2ohjksF0DPvgj6lT2HXQvzlf8VYYAd
bKo4rHMPDUQKhdIR47QTJhucJjo/lH0kF7Mf9PNtksA/0TULiAptCqv+cVK2wsyJ
7vTqMYvFJow/6Bapjih3QGRaZTPRJ6PKLQNFD9v5qw9sdqEHZ5aPB6TZvV35s31o
ubHYmiZOrpFcxHFKHJzW75I85l5245X2tJB8MaQyNvG53Sb/WjI=
=xSF9
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
