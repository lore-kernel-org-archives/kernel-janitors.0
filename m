From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:31 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each:
Message-Id: <20040819111131.GA3535@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7378891137776511=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============7378891137776511==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

s/for/list_for_each/
Compile tested.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/drivers/char/drm/radeon_mem.c	Fri Jul 23 16:00:18 2004
+++ list_for_each/drivers/char/drm/radeon_mem.c	Thu Aug 15 17:58:22 2002
@@ -85,7 +85,7 @@
 	struct mem_block *p;
 	int mask = (1 << align2)-1;
 
-	for (p = heap->next ; p != heap ; p = p->next) {
+	list_for_each(p, heap) {
 		int start = (p->start + mask) & ~mask;
 		if (p->filp == 0 && start + size <= p->start + p->size)
 			return split_block( p, start, size, filp );
@@ -98,7 +98,7 @@
 {
 	struct mem_block *p;
 
-	for (p = heap->next ; p != heap ; p = p->next) 
+	list_for_each(p, heap)
 		if (p->start == start)
 			return p;
 
@@ -166,7 +166,7 @@
 	if (!heap || !heap->next)
 		return;
 
-	for (p = heap->next ; p != heap ; p = p->next) {
+	list_for_each(p, heap) {
 		if (p->filp == filp) 
 			p->filp = NULL;
 	}
@@ -174,7 +174,7 @@
 	/* Assumes a single contiguous range.  Needs a special filp in
 	 * 'heap' to stop it being subsumed.
 	 */
-	for (p = heap->next ; p != heap ; p = p->next) {
+	list_for_each(p, heap) {
 		while (p->filp == 0 && p->next->filp == 0) {
 			struct mem_block *q = p->next;
 			p->size += q->size;

--===============7378891137776511==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7378891137776511==--
