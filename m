From: Shaun Laing <shaun@xresource.ca>
Date: Thu, 06 Mar 2014 15:26:14 +0000
Subject: [PATCH] staging: cxt1e1: removed version string declaration
Message-Id: <1394119574-3352582-1-git-send-email-shaun@xresource.ca>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Removed the unneeded pmcc4_OSSI_release version string, as well as the now
unused 'release' element of the sbe_card_info struct.  This also resolves a
sparse "should it be static" warning.

Signed-off-by: Shaun Laing <shaun@xresource.ca>
---
V2: changed to remove the version string entirely.
Compiles, but I can't test it.  Please let me know if changing the structure
was a bad idea.

 drivers/staging/cxt1e1/Makefile        |    1 -
 drivers/staging/cxt1e1/linux.c         |    3 ---
 drivers/staging/cxt1e1/ossiRelease.c   |   29 -----------------------------
 drivers/staging/cxt1e1/pmcc4_private.h |    1 -
 drivers/staging/cxt1e1/sbeproc.c       |    1 -
 5 files changed, 35 deletions(-)
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
index 579e68e..2924c39 100644
--- a/drivers/staging/cxt1e1/linux.c
+++ b/drivers/staging/cxt1e1/linux.c
@@ -81,7 +81,6 @@ status_t    musycc_chan_down(ci_t *, int);
 irqreturn_t musycc_intr_th_handler(void *);
 int         musycc_start_xmit(ci_t *, int, void *);
 
-extern char pmcc4_OSSI_release[];
 extern ci_t *CI;
 extern struct s_hdw_info hdw_info[];
 
@@ -990,7 +989,6 @@ c4_add_dev(hdw_info_t *hi, int brdno, unsigned long f0, unsigned long f1,
 		CI = ci;                    /* DEBUG, only board 0 usage */
 
 	strcpy(ci->devname, hi->devname);
-	ci->release = &pmcc4_OSSI_release[0];
 
 	/* tasklet */
 #if defined(SBE_ISR_TASKLET)
@@ -1122,7 +1120,6 @@ c4_mod_init(void)
 {
 	int         rtn;
 
-	pr_warning("%s\n", pmcc4_OSSI_release);
 	if ((rtn = c4hw_attach_all()))
 		return -rtn; /* installation failure - see system log */
 
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
diff --git a/drivers/staging/cxt1e1/pmcc4_private.h b/drivers/staging/cxt1e1/pmcc4_private.h
index 7edbd4e..eb28f09 100644
--- a/drivers/staging/cxt1e1/pmcc4_private.h
+++ b/drivers/staging/cxt1e1/pmcc4_private.h
@@ -213,7 +213,6 @@ struct sbe_card_info
     struct sbe_card_info *next;
     u_int32_t  *eeprombase;     /* mapped address of board's EEPROM */
     c4cpld_t   *cpldbase;       /* mapped address of board's CPLD hardware */
-    char       *release;        /* SBE ID string w/in sbeRelease.c */
     void       *hdw_info;
 #ifdef CONFIG_PROC_FS
     struct proc_dir_entry *dir_dev;
diff --git a/drivers/staging/cxt1e1/sbeproc.c b/drivers/staging/cxt1e1/sbeproc.c
index 353c001..e08f79b 100644
--- a/drivers/staging/cxt1e1/sbeproc.c
+++ b/drivers/staging/cxt1e1/sbeproc.c
@@ -150,7 +150,6 @@ static int sbecom_proc_get_sbe_info(struct seq_file *m, void *v)
 		break;
 	}
 	seq_printf(m, "PCI Bus Speed: %s\n", spd);
-	seq_printf(m, "Release:       %s\n", ci->release);
 
 #ifdef SBE_PMCC4_ENABLE
 	{
-- 
1.7.9.5

