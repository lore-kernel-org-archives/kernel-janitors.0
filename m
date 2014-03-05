From: Shaun Laing <shaun@xresource.ca>
Date: Wed, 05 Mar 2014 19:29:31 +0000
Subject: [PATCH] staging: cxt1e1: moved version string declaration
Message-Id: <1394047771-3244238-1-git-send-email-shaun@xresource.ca>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

To resolve a sparse "should it be static" warning, the declaration for the
pmcc4_OSSI_release version string was moved from its own file to linux.c, and
the resulting empty file was deleted.

Signed-off-by: Shaun Laing <shaun@xresource.ca>
---
 drivers/staging/cxt1e1/Makefile      |    1 -
 drivers/staging/cxt1e1/linux.c       |    3 ++-
 drivers/staging/cxt1e1/ossiRelease.c |   29 -----------------------------
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 drivers/staging/cxt1e1/ossiRelease.c

diff --git a/drivers/staging/cxt1e1/Makefile b/drivers/staging/cxt1e1/Makefile
index 2f217e9..b879e7b 100644
--- a/drivers/staging/cxt1e1/Makefile
+++ b/drivers/staging/cxt1e1/Makefile
@@ -4,7 +4,6 @@ ccflags-y := -DSBE_PMCC4_ENABLE
 ccflags-y += -DSBE_ISR_TASKLET
 
 cxt1e1-y := 	\
-  ossiRelease.o 	\
   musycc.o 		\
   pmcc4_drv.o 		\
   comet.o 		\
diff --git a/drivers/staging/cxt1e1/linux.c b/drivers/staging/cxt1e1/linux.c
index 579e68e..b89ade1 100644
--- a/drivers/staging/cxt1e1/linux.c
+++ b/drivers/staging/cxt1e1/linux.c
@@ -81,7 +81,8 @@ status_t    musycc_chan_down(ci_t *, int);
 irqreturn_t musycc_intr_th_handler(void *);
 int         musycc_start_xmit(ci_t *, int, void *);
 
-extern char pmcc4_OSSI_release[];
+static const char pmcc4_OSSI_release[] +	"$Release: PMCC4_3_1B,  Copyright (c) 2008 One Stop Systems$";
 extern ci_t *CI;
 extern struct s_hdw_info hdw_info[];
 
diff --git a/drivers/staging/cxt1e1/ossiRelease.c b/drivers/staging/cxt1e1/ossiRelease.c
deleted file mode 100644
index f17a902..0000000
--- a/drivers/staging/cxt1e1/ossiRelease.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/*-----------------------------------------------------------------------------
- * ossiRelease.c -
- *
- * This string will be embedded into the executable and will track the
- * release.  The embedded string may be displayed using the following:
- *
- *      strings <filename> | grep \$Rel
- *
- * Copyright (C) 2002-2008  One Stop Systems, Inc.
- *
- *   This program is free software; you can redistribute it and/or modify
- *   it under the terms of the GNU General Public License as published by
- *   the Free Software Foundation; either version 2 of the License, or
- *   (at your option) any later version.
- *
- *   This program is distributed in the hope that it will be useful,
- *   but WITHOUT ANY WARRANTY; without even the implied warranty of
- *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *   GNU General Public License for more details.
- *
- * For further information, contact via email: support@onestopsystems.com
- * One Stop Systems, Inc.  Escondido, California  U.S.A.
- *
- *-----------------------------------------------------------------------------
- */
-
-char pmcc4_OSSI_release[] = "$Release: PMCC4_3_1B,  Copyright (c) 2008 One Stop Systems$";
-
-/***  End-of-File  ***/
-- 
1.7.9.5

