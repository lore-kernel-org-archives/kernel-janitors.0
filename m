From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:42:51 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114250.GB2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============071241105961237894=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============071241105961237894==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Make code more readable with list_for_each_entry*
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/i386/mm/pageattr.c	Wed Jul 14 19:14:46 2004
+++ list_for_each/arch/i386/mm/pageattr.c	Thu Aug 15 18:08:02 2002
@@ -178,7 +178,7 @@
 void global_flush_tlb(void)
 { 
 	LIST_HEAD(l);
-	struct list_head* n;
+	struct page *pg, *next;
 
 	BUG_ON(irqs_disabled());
 
@@ -186,12 +186,8 @@
 	list_splice_init(&df_list, &l);
 	spin_unlock_irq(&cpa_lock);
 	flush_map();
-	n = l.next;
-	while (n != &l) {
-		struct page *pg = list_entry(n, struct page, lru);
-		n = n->next;
+	list_for_each_entry_safe(pg, next, &l, lru)
 		__free_page(pg);
-	}
 } 
 
 #ifdef CONFIG_DEBUG_PAGEALLOC

--===============071241105961237894==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============071241105961237894==--
