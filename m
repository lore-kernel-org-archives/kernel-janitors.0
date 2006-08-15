From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Date: Tue, 15 Aug 2006 09:02:07 +0000
Subject: [KJ] PATCH: Fix typo in net/sched/cls_u32.c
Message-Id: <20060815090207.GO27850@charite.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>

Fixes a typo in net/sched/cls_u32.c.orig

Signed-off-by: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>

---

--- /usr/src/linux-2.6.17.8/net/sched/cls_u32.c.orig	2006-08-13 12:51:55.00=
0000000 +0200
+++ /usr/src/linux-2.6.17.8/net/sched/cls_u32.c	2006-08-13 12:52:06.0000000=
00 +0200
@@ -802,7 +802,7 @@
 {
 	printk("u32 classifier\n");
 #ifdef CONFIG_CLS_U32_PERF
-	printk("    Perfomance counters on\n");
+	printk("    Performance counters on\n");
 #endif
 #ifdef CONFIG_NET_CLS_POLICE
 	printk("    OLD policer on \n");


--=20
_________________________________________________

  Charit=E9 - Universit=E4tsmedizin Berlin
_________________________________________________

  Ralf Hildebrandt
   i.A. Gesch=E4ftsbereich Informationsmanagement
   Campus Benjamin Franklin
   Hindenburgdamm 30 | Berlin
   Tel. +49 30 450 570155 | Fax +49 30 450 570962
   Ralf.Hildebrandt@charite.de
   http://www.charite.de
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
