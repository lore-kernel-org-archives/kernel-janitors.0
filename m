From: Domen Puncer <domen@coderock.org>
Date: Fri, 16 Jan 2004 21:05:05 +0000
Subject: [Kernel-janitors] [patch 2.6.1] remove empty lmc_proto_raw.h
Message-Id: <200401162205.05619.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

diff -pruNX dontdiff c/drivers/net/wan/lmc/lmc_proto.c a/drivers/net/wan/lmc/lmc_proto.c
--- c/drivers/net/wan/lmc/lmc_proto.c	2003-12-18 03:58:57.000000000 +0100
+++ a/drivers/net/wan/lmc/lmc_proto.c	2004-01-10 17:13:21.000000000 +0100
@@ -50,7 +50,6 @@
 #include "lmc_debug.h"
 #include "lmc_ioctl.h"
 #include "lmc_proto.h"
-//#include "lmc_proto_raw.h"
 
 /*
  * The compile-time variable SPPPSTUP causes the module to be
diff -pruNX dontdiff c/drivers/net/wan/lmc/lmc_proto_raw.h a/drivers/net/wan/lmc/lmc_proto_raw.h
--- c/drivers/net/wan/lmc/lmc_proto_raw.h	2003-12-18 03:58:48.000000000 +0100
+++ a/drivers/net/wan/lmc/lmc_proto_raw.h	1970-01-01 01:00:00.000000000 +0100
@@ -1,4 +0,0 @@
-#ifndef _LMC_PROTO_RAW_H_
-#define _LMC_PROTO_RAW_H_
-
-#endif

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
