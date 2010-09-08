From: some.one@weego.fi
Date: Wed, 08 Sep 2010 06:15:03 +0000
Subject: [patch 1/1] Quilt test patch
Message-Id: <20100908061515.101225734@weego.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Test patch to using quilt.

Signed-off-by: Petro Väätäinen <petro.vaatainen@weego.fi>
Index: linux-2.6/Makefile
=================================--- linux-2.6.orig/Makefile	2010-09-07 10:04:01.919067001 +0300
+++ linux-2.6/Makefile	2010-09-07 10:08:15.491066999 +0300
@@ -1,8 +1,8 @@
 VERSION = 2
 PATCHLEVEL = 6
 SUBLEVEL = 36
-EXTRAVERSION = -rc3
-NAME = Sheep on Meth
+EXTRAVERSION = -rc3-pva
+NAME = Quilt test
 
 # *DOCUMENTATION*
 # To see a list of typical targets execute "make help"

