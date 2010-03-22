From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Mar 2010 12:12:42 +0000
Subject: [patch] mfd: off by one calculating size
Message-Id: <20100322121242.GL21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, Richard =?iso-8859-1?Q?R=F6jfors?= <richard.rojfors@pelagicore.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I'm pretty sure that it should be + 1 here.  It's an off by one, because
we start counting at zero.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Found by a static checker and untested.  Please review carefully.

diff --git a/drivers/mfd/timberdale.h b/drivers/mfd/timberdale.h
index 8d27ffa..902c451 100644
--- a/drivers/mfd/timberdale.h
+++ b/drivers/mfd/timberdale.h
@@ -66,7 +66,7 @@
 
 #define CHIPCTLOFFSET	0x800
 #define CHIPCTLEND	0x8ff
-#define CHIPCTLSIZE	(CHIPCTLEND - CHIPCTLOFFSET)
+#define CHIPCTLSIZE	(CHIPCTLEND - CHIPCTLOFFSET + 1)
 
 #define INTCOFFSET	0xc00
 #define INTCEND		0xfff
