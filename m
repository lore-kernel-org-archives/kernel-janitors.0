From: Byeoungwook Kim <quddnr145@gmail.com>
Date: Mon, 01 Feb 2016 05:16:47 +0000
Subject: [PATCH] staging: rtl8192u: Fix block comments use * on subsequent lines in r8192U_wx.c
Message-Id: <20160201051647.GA5001@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: ksenija.stanojevic@gmail.com, luisbg@osg.samsung.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

clean up checkpatch warning:
WARNING: Block comments use * on subsequent lines

Signed-off-by: Byeoungwook Kim <quddnr145@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_wx.c | 38 +++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_wx.c b/drivers/staging/rtl8192u/r8192U_wx.c
index 4911fef..f828e64 100644
--- a/drivers/staging/rtl8192u/r8192U_wx.c
+++ b/drivers/staging/rtl8192u/r8192U_wx.c
@@ -1,21 +1,23 @@
-/*
-   This file contains wireless extension handlers.
-
-   This is part of rtl8180 OpenSource driver.
-   Copyright (C) Andrea Merello 2004-2005  <andrea.merello@gmail.com>
-   Released under the terms of GPL (General Public Licence)
-
-   Parts of this driver are based on the GPL part
-   of the official realtek driver.
-
-   Parts of this driver are based on the rtl8180 driver skeleton
-   from Patric Schenke & Andres Salomon.
-
-   Parts of this driver are based on the Intel Pro Wireless 2100 GPL driver.
-
-   We want to thank the Authors of those projects and the Ndiswrapper
-   project Authors.
-*/
+/******************************************************************************
+ *
+ * This file contains wireless extension handlers.
+ *
+ * This is part of rtl8180 OpenSource driver.
+ * Copyright (C) Andrea Merello 2004-2005  <andrea.merello@gmail.com>
+ * Released under the terms of GPL (General Public Licence)
+ *
+ * Parts of this driver are based on the GPL part
+ * of the official realtek driver.
+ *
+ * Parts of this driver are based on the rtl8180 driver skeleton
+ * from Patric Schenke & Andres Salomon.
+ *
+ * Parts of this driver are based on the Intel Pro Wireless 2100 GPL driver.
+ *
+ * We want to thank the Authors of those projects and the Ndiswrapper
+ * project Authors.
+ *
+ *****************************************************************************/
 
 #include <linux/string.h>
 #include "r8192U.h"
-- 
2.5.0

