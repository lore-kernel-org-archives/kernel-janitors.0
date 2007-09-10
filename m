From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 10 Sep 2007 12:49:14 +0000
Subject: [PATCH] Documentation:  Replace incorrect "rcu" prefix with "rcupdate".
Message-Id: <Pine.LNX.4.64.0709100847580.3384@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-parameters.txt
index b41cde3..463125d 100644
--- a/Documentation/kernel-parameters.txt
+++ b/Documentation/kernel-parameters.txt
@@ -1449,14 +1449,17 @@ and is between 256 and 4096 characters. It is defined in the file
 			New name for the ramdisk parameter.
 			See Documentation/ramdisk.txt.

-	rcu.blimit=	[KNL,BOOT] Set maximum number of finished
-			RCU callbacks to process in one batch.
+	rcupdate.blimit=	[KNL,BOOT]
+			Set maximum number of finished RCU callbacks to process
+			in one batch.

-	rcu.qhimark=	[KNL,BOOT] Set threshold of queued
+	rcupdate.qhimark=	[KNL,BOOT]
+			Set threshold of queued
 			RCU callbacks over which batch limiting is disabled.

-	rcu.qlowmark=	[KNL,BOOT] Set threshold of queued
-			RCU callbacks below which batch limiting is re-enabled.
+	rcupdate.qlowmark=	[KNL,BOOT]
+			Set threshold of queued RCU callbacks below which
+			batch limiting is re-enabled.

 	rdinit=		[KNL]
 			Format: <full_path>
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
