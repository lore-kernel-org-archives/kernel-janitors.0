From: Ricardo Martins <ricardo@scarybox.net>
Date: Fri, 02 May 2008 16:19:40 +0000
Subject: warning: =?utf-8?B?4oCYcGNpX2ZpbmRfZGV2?=
Message-Id: <20080502161940.GA27311@macbookpro>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="gKMricLos+KVdGMg"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--gKMricLos+KVdGMg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

There are 14 drivers in drivers/isdn/hisax/ still using calls to
pci_find_device() instead of the pci_get_device(). From what I gather, a
simple sed 's|pci_find_device|pci_get_device|' is enough to fix this,
since both functions use the same input and give the same output.
Is this correct?

Also, since there are 14 drivers with only those 1-line changes, should each
driver have its own patch or could I send a single patch covering all of
them?

Regards,
--=20
 Ricardo Martins  *  scarybox.net  *  GPG key: 0x1308F1B4

--gKMricLos+KVdGMg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkgbPxwACgkQkH81LRMI8bR/rwCfVn2BHpQspfJKUoZCR4MAH9m5
yiYAnRX1oWV+Too7RRq26K8tdPolX2D7
=6Yqt
-----END PGP SIGNATURE-----

--gKMricLos+KVdGMg--
