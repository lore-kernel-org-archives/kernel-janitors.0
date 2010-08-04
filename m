From: Kyle Spaans <kspaans@uwaterloo.ca>
Date: Wed, 04 Aug 2010 00:58:04 +0000
Subject: Re: [PATCH] drivers/mtd: remove makefile subdirectory processing
Message-Id: <20100804005804.GA11770@taurine.csclub.uwaterloo.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mP3DRpeJDSE+ciuQ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100714042509.GA7775@caffeine.csclub.uwaterloo.ca>
	<1279471590.16247.57.camel@localhost.localdomain>
	<20100720021718.GA32479@caffeine.csclub.uwaterloo.ca>
	<1279706975.2306.4.camel@localhost>
In-Reply-To: <1279706975.2306.4.camel@localhost>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Remove redundant config checks when the subdirectory's Makefile is already
conditionally processed. Add more conditional processing when the subdirect=
ory
can be selected/deselected as a whole.

Signed-off-by: Kyle Spaans <kspaans@uwaterloo.ca>
---
 drivers/mtd/Makefile         |    6 +++++-
 drivers/mtd/lpddr/Makefile   |    2 +-
 drivers/mtd/nand/Makefile    |    2 +-
 drivers/mtd/onenand/Makefile |    4 ++--
 drivers/mtd/tests/Makefile   |   16 ++++++++--------
 drivers/mtd/ubi/Makefile     |    2 +-
 6 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/Makefile b/drivers/mtd/Makefile
index 760abc5..3bf50bd 100644
--- a/drivers/mtd/Makefile
+++ b/drivers/mtd/Makefile
@@ -30,6 +30,10 @@ obj-$(CONFIG_MTD_OOPS)		+=3D mtdoops.o
 nftl-objs		:=3D nftlcore.o nftlmount.o
 inftl-objs		:=3D inftlcore.o inftlmount.o
=20
-obj-y		+=3D chips/ lpddr/ maps/ devices/ nand/ onenand/ tests/
+obj-y		+=3D chips/ maps/ devices/
=20
+obj-$(CONFIG_MTD_TESTS)		+=3D tests/
+obj-$(CONFIG_MTD_LPDDR)		+=3D lpddr/
+obj-$(CONFIG_MTD_NAND)		+=3D nand/
+obj-$(CONFIG_MTD_ONENAND)	+=3D onenand/
 obj-$(CONFIG_MTD_UBI)		+=3D ubi/
diff --git a/drivers/mtd/lpddr/Makefile b/drivers/mtd/lpddr/Makefile
index da48e46..0e9be65 100644
--- a/drivers/mtd/lpddr/Makefile
+++ b/drivers/mtd/lpddr/Makefile
@@ -3,4 +3,4 @@
 #
=20
 obj-$(CONFIG_MTD_QINFO_PROBE)	+=3D qinfo_probe.o
-obj-$(CONFIG_MTD_LPDDR)	+=3D lpddr_cmds.o
+obj-y				+=3D lpddr_cmds.o
diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index e8ab884..8fe5869 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -2,7 +2,7 @@
 # linux/drivers/nand/Makefile
 #
=20
-obj-$(CONFIG_MTD_NAND)			+=3D nand.o
+obj-y					+=3D nand.o
 obj-$(CONFIG_MTD_NAND_ECC)		+=3D nand_ecc.o
 obj-$(CONFIG_MTD_NAND_IDS)		+=3D nand_ids.o
 obj-$(CONFIG_MTD_SM_COMMON) 		+=3D sm_common.o
diff --git a/drivers/mtd/onenand/Makefile b/drivers/mtd/onenand/Makefile
index 2b7884c..f6a8495 100644
--- a/drivers/mtd/onenand/Makefile
+++ b/drivers/mtd/onenand/Makefile
@@ -3,12 +3,12 @@
 #
=20
 # Core functionality.
-obj-$(CONFIG_MTD_ONENAND)		+=3D onenand.o
+obj-y					+=3D onenand.o
=20
 # Board specific.
 obj-$(CONFIG_MTD_ONENAND_GENERIC)	+=3D generic.o
 obj-$(CONFIG_MTD_ONENAND_OMAP2)		+=3D omap2.o
-obj-$(CONFIG_MTD_ONENAND_SAMSUNG)       +=3D samsung.o
+obj-$(CONFIG_MTD_ONENAND_SAMSUNG)	+=3D samsung.o
=20
 # Simulator
 obj-$(CONFIG_MTD_ONENAND_SIM)		+=3D onenand_sim.o
diff --git a/drivers/mtd/tests/Makefile b/drivers/mtd/tests/Makefile
index b44dcab..14adc55 100644
--- a/drivers/mtd/tests/Makefile
+++ b/drivers/mtd/tests/Makefile
@@ -1,8 +1,8 @@
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_oobtest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_pagetest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_readtest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_speedtest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_stresstest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_subpagetest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_torturetest.o
-obj-$(CONFIG_MTD_TESTS) +=3D mtd_nandecctest.o
+obj-y +=3D mtd_oobtest.o
+obj-y +=3D mtd_pagetest.o
+obj-y +=3D mtd_readtest.o
+obj-y +=3D mtd_speedtest.o
+obj-y +=3D mtd_stresstest.o
+obj-y +=3D mtd_subpagetest.o
+obj-y +=3D mtd_torturetest.o
+obj-y +=3D mtd_nandecctest.o
diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
index c9302a5..caf0316 100644
--- a/drivers/mtd/ubi/Makefile
+++ b/drivers/mtd/ubi/Makefile
@@ -1,4 +1,4 @@
-obj-$(CONFIG_MTD_UBI) +=3D ubi.o
+obj-y +=3D ubi.o
=20
 ubi-y +=3D vtbl.o vmt.o upd.o build.o cdev.o kapi.o eba.o io.o wl.o scan.o
 ubi-y +=3D misc.o
--=20
1.5.6.5


--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkxYuxwACgkQ7ECsBhUMPvCPdACdHPkG4WM42zE7Efu854bpKNMA
h9kAoI//XqxSvVwgWHGXJdL7K5xZUBCK
=hUa5
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
