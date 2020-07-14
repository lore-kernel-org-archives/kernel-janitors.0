From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Tue, 14 Jul 2020 14:35:28 +0000
Subject: [PATCH v2] decnet: dn_dev: Remove an unnecessary label.
Message-Id: <20200714142328.GA4630@blackclown>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
List-Id: <kernel-janitors.vger.kernel.org>
To: davem@davemloft.net, kuba@kernel.org
Cc: linux-decnet-user@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Remove the unnecessary label from dn_dev_ioctl() and make its error
handling simpler to read.

Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
---
Changes:
	v2: Fixed indentation of break statement.
	On Julia's Advise.

 net/decnet/dn_dev.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/net/decnet/dn_dev.c b/net/decnet/dn_dev.c
index 65abcf1b3210..15d42353f1a3 100644
--- a/net/decnet/dn_dev.c
+++ b/net/decnet/dn_dev.c
@@ -462,7 +462,9 @@ int dn_dev_ioctl(unsigned int cmd, void __user *arg)
 	switch (cmd) {
 	case SIOCGIFADDR:
 		*((__le16 *)sdn->sdn_nodeaddr) =3D ifa->ifa_local;
-		goto rarok;
+		if (copy_to_user(arg, ifr, DN_IFREQ_SIZE))
+			ret =3D -EFAULT;
+		break;
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


--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE7AbCa0kOsMJ4cx0j+gRsbIfe744FAl8Nv98ACgkQ+gRsbIfe
744SBw//XXzvT5FeU8+f+Jc8gBRa/b/jUV4iub7AShQVkpcgrPENNYxxGRFIJUe9
Po8iUt8TiYwo2MhrbbvzLYQ8TxbV9IVNRGqaZepbb0xcNi2Gnu5ni+Lvy/R7xAYT
rGQxpRw8o/I38zozphH5+nCqMVtNlHRV6VXvWTuqmm+gEuyEnr7PGidDwqcd/2S2
Dk53cBzq1EF99SrLtRJhTlXHQgZgZqPQvgjH3xbyY/hoix2oSHwZar3h+uHnnUSR
bd2bvT/1karQCphYX3ZH/r5l0nJECAteb2kCezmb6KVj+7OEVN8jGFNf2QMj6zPb
q20WePzjcGFnjjwml8SRhTq+LRMjox4NfNQ8LWk77tudYnxww+JLdvJFqeXemXmV
Ba30Sfvu/yXHFnirAIUzvt9+7ZKyIaFNjBdQE+qdaD+SRX8uRqX/XrMzxKNZuU7M
ADKBSKWRaKIRISbXdly2exmDC1gpMx3DJLzJs+WpxFpSAGW6+ct1PdnrMPzbCJYx
pE9MvnSH2yEbll9r/91hjhN/vJR+rsrUXzIFfgs00kpSOznN4nmaOXmz7843HYUF
ciRMSB+dvZpoKxzGkFRQ2gE6WCP1OCQUh+tCO19CH9mYnu/eVikH971xfo4g/koK
emUzUBF4WozXlwI2xlZLK4J3SRU3G639DHOAbVsewJzmmMNsLX8=
=Hjwo
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
