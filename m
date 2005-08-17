From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 17 Aug 2005 20:09:18 +0000
Subject: [KJ] [PATCH] atm: remove __AAL_STAT_ITEMS
Message-Id: <20050817200918.GA28723@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98812159122201737=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98812159122201737==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 include/linux/atmdev.h |   24 ++++++++++--------------
 net/atm/resources.c    |   16 ++++++++++------
 2 files changed, 20 insertions(+), 20 deletions(-)

--- linux-vanilla/include/linux/atmdev.h
+++ linux-atmdev/include/linux/atmdev.h
@@ -30,18 +30,12 @@
 #define ATM_DS3_PCR	(8000*12)
 			/* DS3: 12 cells in a 125 usec time slot */
 
-
-#define __AAL_STAT_ITEMS \
-    __HANDLE_ITEM(tx);			/* TX okay */ \
-    __HANDLE_ITEM(tx_err);		/* TX errors */ \
-    __HANDLE_ITEM(rx);			/* RX okay */ \
-    __HANDLE_ITEM(rx_err);		/* RX errors */ \
-    __HANDLE_ITEM(rx_drop);		/* RX out of memory */
-
 struct atm_aal_stats {
-#define __HANDLE_ITEM(i) int i
-	__AAL_STAT_ITEMS
-#undef __HANDLE_ITEM
+	int tx;		/* TX okay */
+	int tx_err;	/* TX errors */
+	int rx;		/* RX okay */
+	int rx_err;	/* RX errors */
+	int rx_drop;	/* RX out of memory */
 };
 
 
@@ -219,9 +213,11 @@ extern struct proc_dir_entry *atm_proc_r
 
 
 struct k_atm_aal_stats {
-#define __HANDLE_ITEM(i) atomic_t i
-	__AAL_STAT_ITEMS
-#undef __HANDLE_ITEM
+	atomic_t tx;		/* TX okay */
+	atomic_t tx_err;	/* TX errors */
+	atomic_t rx;		/* RX okay */
+	atomic_t rx_err;	/* RX errors */
+	atomic_t rx_drop;	/* RX out of memory */
 };
 
 
--- linux-vanilla/net/atm/resources.c
+++ linux-atmdev/net/atm/resources.c
@@ -161,18 +161,22 @@ void shutdown_atm_dev(struct atm_dev *de
 static void copy_aal_stats(struct k_atm_aal_stats *from,
     struct atm_aal_stats *to)
 {
-#define __HANDLE_ITEM(i) to->i = atomic_read(&from->i)
-	__AAL_STAT_ITEMS
-#undef __HANDLE_ITEM
+	to->tx = atomic_read(&from->tx);
+	to->tx_err = atomic_read(&from->tx_err);
+	to->rx = atomic_read(&from->rx);
+	to->rx_err = atomic_read(&from->rx_err);
+	to->rx_drop = atomic_read(&from->rx_drop);
 }
 
 
 static void subtract_aal_stats(struct k_atm_aal_stats *from,
     struct atm_aal_stats *to)
 {
-#define __HANDLE_ITEM(i) atomic_sub(to->i, &from->i)
-	__AAL_STAT_ITEMS
-#undef __HANDLE_ITEM
+	atomic_sub(to->tx, &from->tx);
+	atomic_sub(to->tx_err, &from->tx_err);
+	atomic_sub(to->rx, &from->rx);
+	atomic_sub(to->rx_err, &from->rx_err);
+	atomic_sub(to->rx_drop, &from->rx_drop);
 }
 
 


--===============98812159122201737==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98812159122201737==--
