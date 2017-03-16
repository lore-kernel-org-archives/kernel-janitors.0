From: "Andrew F. Davis" <afd@ti.com>
Date: Thu, 16 Mar 2017 15:19:54 +0000
Subject: [PATCH 2/3] w1: Remove unneeded use of assert() and remove w1_log.h
Message-Id: <20170316151955.10710-3-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170316151955.10710-1-afd@ti.com>
In-Reply-To: <20170316151955.10710-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

The only use of assert() is in matrox_w1.c and is used to check the input
to probe() from the PCI subsystem for NULL values, these are guaranteed
to be populated and no other PCI driver makes this check, remove this.

As this was the only definition in w1_log.h, remove this also.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/w1/masters/matrox_w1.c |  6 ------
 drivers/w1/w1.c                |  1 -
 drivers/w1/w1_int.c            |  1 -
 drivers/w1/w1_io.c             |  1 -
 drivers/w1/w1_log.h            | 31 -------------------------------
 drivers/w1/w1_netlink.c        |  1 -
 6 files changed, 41 deletions(-)
 delete mode 100644 drivers/w1/w1_log.h

diff --git a/drivers/w1/masters/matrox_w1.c b/drivers/w1/masters/matrox_w1.c
index cbdf4c9d895c..f20d03ecfd1d 100644
--- a/drivers/w1/masters/matrox_w1.c
+++ b/drivers/w1/masters/matrox_w1.c
@@ -36,7 +36,6 @@
 
 #include "../w1.h"
 #include "../w1_int.h"
-#include "../w1_log.h"
 
 /*
  * Matrox G400 DDC registers.
@@ -134,9 +133,6 @@ static int matrox_w1_probe(struct pci_dev *pdev, const struct pci_device_id *ent
 	struct matrox_device *dev;
 	int err;
 
-	assert(pdev != NULL);
-	assert(ent != NULL);
-
 	if (pdev->vendor != PCI_VENDOR_ID_MATROX || pdev->device != PCI_DEVICE_ID_MATROX_G400)
 		return -ENODEV;
 
@@ -201,8 +197,6 @@ static void matrox_w1_remove(struct pci_dev *pdev)
 {
 	struct matrox_device *dev = pci_get_drvdata(pdev);
 
-	assert(dev != NULL);
-
 	if (dev->found) {
 		w1_remove_master_device(dev->bus_master);
 		iounmap(dev->virt_addr);
diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 281abfd369b8..8172dee5e23c 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -29,7 +29,6 @@
 #include <linux/atomic.h>
 
 #include "w1.h"
-#include "w1_log.h"
 #include "w1_int.h"
 #include "w1_family.h"
 #include "w1_netlink.h"
diff --git a/drivers/w1/w1_int.c b/drivers/w1/w1_int.c
index 0a3b1ea25765..4439d10709bb 100644
--- a/drivers/w1/w1_int.c
+++ b/drivers/w1/w1_int.c
@@ -22,7 +22,6 @@
 #include <linux/moduleparam.h>
 
 #include "w1.h"
-#include "w1_log.h"
 #include "w1_netlink.h"
 #include "w1_int.h"
 
diff --git a/drivers/w1/w1_io.c b/drivers/w1/w1_io.c
index de8bebc27896..1134e6b1eb02 100644
--- a/drivers/w1/w1_io.c
+++ b/drivers/w1/w1_io.c
@@ -19,7 +19,6 @@
 #include <linux/module.h>
 
 #include "w1.h"
-#include "w1_log.h"
 
 static int w1_delay_parm = 1;
 module_param_named(delay_coef, w1_delay_parm, int, 0);
diff --git a/drivers/w1/w1_log.h b/drivers/w1/w1_log.h
deleted file mode 100644
index dd1422b6afbb..000000000000
--- a/drivers/w1/w1_log.h
+++ /dev/null
@@ -1,31 +0,0 @@
-/*
- * Copyright (c) 2004 Evgeniy Polyakov <zbr@ioremap.net>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef __W1_LOG_H
-#define __W1_LOG_H
-
-#define DEBUG
-
-#ifdef W1_DEBUG
-#  define assert(expr) do {} while (0)
-#else
-#  define assert(expr) \
-        if(unlikely(!(expr))) {				        \
-		pr_err("Assertion failed! %s,%s,%s,line=%d\n",	\
-		#expr, __FILE__, __func__, __LINE__);		\
-        }
-#endif
-
-#endif /* __W1_LOG_H */
-
diff --git a/drivers/w1/w1_netlink.c b/drivers/w1/w1_netlink.c
index 18374cad3ace..027950f997d1 100644
--- a/drivers/w1/w1_netlink.c
+++ b/drivers/w1/w1_netlink.c
@@ -18,7 +18,6 @@
 #include <linux/connector.h>
 
 #include "w1.h"
-#include "w1_log.h"
 #include "w1_netlink.h"
 
 #if defined(CONFIG_W1_CON) && (defined(CONFIG_CONNECTOR) || (defined(CONFIG_CONNECTOR_MODULE) && defined(CONFIG_W1_MODULE)))
-- 
2.11.0

