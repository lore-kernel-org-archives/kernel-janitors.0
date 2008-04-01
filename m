From: Leonardo Potenza <lpotenza@inwind.it>
Date: Tue, 01 Apr 2008 21:49:29 +0000
Subject: [PATCH] drivers/atm/iphase.c: compilation warning fix
Message-Id: <200804012349.29836.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200712232159.29844.lpotenza@inwind.it>
In-Reply-To: <200712232159.29844.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: chas@cmf.nrl.navy.mil, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

Removed the warning messages:
drivers/atm/iphase.c:961: warning: 'tcnter' defined but not used
drivers/atm/iphase.c:963: warning: 'xdump' defined but not used

tcnter and xdump() are used only in debug build

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---

iphase.c |    2 ++
1 file changed, 2 insertions(+)

--- linux-2.6.orig/drivers/atm/iphase.c
+++ linux-2.6/drivers/atm/iphase.c
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
