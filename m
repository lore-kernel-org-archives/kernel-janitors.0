From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Sat, 27 Oct 2007 15:32:45 +0000
Subject: [PATCH] HEADERS: rename macro to prevent multiple inclusion in
Message-Id: <Pine.LNX.4.64.0710271127490.29319@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

Having the macro to prevent multiple inclusion of
include/linux/dma-mapping.h contain the prefix "_ASM" is just begging
for possible confusion some day.

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 101a2d4..4470950 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -1,5 +1,5 @@
-#ifndef _ASM_LINUX_DMA_MAPPING_H
-#define _ASM_LINUX_DMA_MAPPING_H
+#ifndef _LINUX_DMA_MAPPING_H
+#define _LINUX_DMA_MAPPING_H

 #include <linux/device.h>
 #include <linux/err.h>
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
