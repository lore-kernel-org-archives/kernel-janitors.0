From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:43:49 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114349.GD2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83460275685415486=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============83460275685415486==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make code more readable with list_for_each_entry.
(Note that break follows that list_del, so we don't need to use _safe)
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/atm/he.c	Fri Jul 23 16:00:17 2004
+++ list_for_each/drivers/atm/he.c	Wed Jul 28 18:20:14 2004
@@ -1962,7 +1962,7 @@
 	struct he_tpd *tpd;
 	int slot, updated = 0;
 #ifdef USE_TPD_POOL
-	struct list_head *p;
+	struct he_tpd *__tpd;
 #endif
 
 	/* 2.1.6 transmit buffer return queue */
@@ -1977,8 +1977,7 @@
 			TBRQ_MULTIPLE(he_dev->tbrq_head) ? " MULTIPLE" : "");
 #ifdef USE_TPD_POOL
 		tpd = NULL;
-		list_for_each(p, &he_dev->outstanding_tpds) {
-			struct he_tpd *__tpd = list_entry(p, struct he_tpd, entry);
+		list_for_each_entry(__tpd, &he_dev->outstanding_tpds, entry) {
 			if (TPD_ADDR(__tpd->status) == TBRQ_TPD(he_dev->tbrq_head)) {
 				tpd = __tpd;
 				list_del(&__tpd->entry);

--===============83460275685415486==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83460275685415486==--
