From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 16 Dec 2005 00:12:54 +0000
Subject: [KJ] [Patch] check unsigned < 0 in
Message-Id: <1134691975.14588.8.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49548969857273883=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49548969857273883==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

since get_settings() returns a signed int and it gets checked
for < 0 to catch an error, res should be a signed int too.

I saw there are quite some modifications to this file in -mm
what is the way to deal with this? Should one create a patch
agains -mm instead of the latest git in such a case?

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/net/bonding/bond_main.c.orig	2005-12-16 01:07:49.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/net/bonding/bond_main.c	2005-12-16 01:07:58.000000000 +0100
@@ -1032,7 +1032,7 @@ static int bond_update_speed_duplex(stru
 	slave->duplex = DUPLEX_FULL;
 
 	if (slave_dev->ethtool_ops) {
-		u32 res;
+		int res;
 
 		if (!slave_dev->ethtool_ops->get_settings) {
 			return -1;



--===============49548969857273883==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49548969857273883==--
