From: andre@finow14.de
Date: Thu, 30 Aug 2007 10:36:12 +0000
Subject: [KJ][patch 1/3] IDT77252: use abs() from kernel.h where appropriate
Message-Id: <20070830103612.GB14925@ahaupt-debian-vm.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070830102551.131398783@finow14.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andre Haupt <andre@finow14.de>, ecd@atecom.com

From: Andre Haupt <andre@finow14.de>
Signed-off-by: Andre Haupt <andre@finow14.de>
---
Index: linus/drivers/atm/idt77252.c
=================================--- linus.orig/drivers/atm/idt77252.c	2007-08-30 11:33:22.000000000 +0200
+++ linus/drivers/atm/idt77252.c	2007-08-30 11:37:00.000000000 +0200
@@ -2092,7 +2092,7 @@ idt77252_rate_logindex(struct idt77252_d
 {
 	u16 afp;
 
-	afp = idt77252_int_to_atmfp(pcr < 0 ? -pcr : pcr);
+	afp = idt77252_int_to_atmfp(abs(pcr));
 	if (pcr < 0)
 		return rate_to_log[(afp >> 5) & 0x1ff];
 	return rate_to_log[((afp >> 5) + 1) & 0x1ff];
@@ -2149,7 +2149,7 @@ idt77252_init_est(struct vc_map *vc, int
 	est = kzalloc(sizeof(struct rate_estimator), GFP_KERNEL);
 	if (!est)
 		return NULL;
-	est->maxcps = pcr < 0 ? -pcr : pcr;
+	est->maxcps = abs(pcr);
 	est->cps = est->maxcps;
 	est->avcps = est->cps << 5;
 

--
