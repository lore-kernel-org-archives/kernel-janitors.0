From: Leonardo Potenza <lpotenza@inwind.it>
Date: Sun, 23 Dec 2007 20:59:29 +0000
Subject: [PATCH] drivers/atm/iphase.c: compilation warning fix
Message-Id: <200712232159.29844.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

Compilation warning fix (tcnter and xdump() used only in debug build)

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---

When trying to build with CONFIG_ATM_IA_DEBUG not set, I got the following warning messages:
drivers/atm/iphase.c:961: warning: 'tcnter' defined but not used
drivers/atm/iphase.c:963: warning: 'xdump' defined but not used

--- linux-2.6/drivers/atm/iphase.c.orig	2007-12-23 17:57:16.000000000 +0100
+++ linux-2.6/drivers/atm/iphase.c	2007-12-23 18:00:23.000000000 +0100
@@ -958,6 +958,7 @@ static void ia_suni_pm7345_init (IADEV *
 
 /***************************** IA_LIB END *****************************/
     
+#ifdef CONFIG_ATM_IA_DEBUG
 static int tcnter = 0;
 static void xdump( u_char*  cp, int  length, char*  prefix )
 {
@@ -992,6 +993,7 @@ static void xdump( u_char*  cp, int  len
     }
 
 }  /* close xdump(... */
+#endif /* CONFIG_ATM_IA_DEBUG */
 
   
 static struct atm_dev *ia_boards = NULL;  
