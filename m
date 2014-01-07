From: Frank Haverkamp <haver@linux.vnet.ibm.com>
Date: Tue, 07 Jan 2014 14:41:24 +0000
Subject: [PATCH 2/3] GenWQE: Fix compile problems for Alpha
Message-Id: <1389105685-25245-2-git-send-email-haver@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1389105556.15325.22.camel@oc7383187364.ibm.com>
In-Reply-To: <1389105556.15325.22.camel@oc7383187364.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, dan.carpenter@oracle.com, fengguang.wu@intel.com, weiyj.lk@gmail.com, jim.epost@gmail.com, sfr@canb.auug.org.au, jsvogt@de.ibm.com, MIJUNG@de.ibm.com, michael@ibmra.de, schwidefsky@de.ibm.com, cody@linux.vnet.ibm.com, cascardo@linux.vnet.ibm.com, kernel-janitors@vger.kernel.org, haver@linux.vnet.ibm.com

The header which contained the declaration for kcalloc() was not
inlcuded.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Frank Haverkamp <haver@linux.vnet.ibm.com>
---
 drivers/misc/genwqe/card_base.h |    1 +
 drivers/misc/genwqe/card_ddcb.c |    1 +
 2 files changed, 2 insertions(+)

--- a/drivers/misc/genwqe/card_base.h
+++ b/drivers/misc/genwqe/card_base.h
@@ -36,6 +36,7 @@
 #include <linux/io.h>
 #include <linux/version.h>
 #include <linux/debugfs.h>
+#include <linux/slab.h>
 
 #include <linux/genwqe/genwqe_card.h>
 #include "genwqe_driver.h"
--- a/drivers/misc/genwqe/card_ddcb.c
+++ b/drivers/misc/genwqe/card_ddcb.c
@@ -38,6 +38,7 @@
 #include <linux/interrupt.h>
 #include <linux/crc-itu-t.h>
 
+#include "card_base.h"
 #include "card_ddcb.h"
 
 /*

