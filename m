From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 26 Oct 2015 21:28:26 +0000
Subject: [PATCH 2/2 v2] coccinelle: ifnullfree: handle various destroy functions
Message-Id: <1445894906-28137-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

Extend ifnullfree to the various destroy functions that were recently
extended to tolerate NULL arguments.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: better subject

 scripts/coccinelle/free/ifnullfree.cocci |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/coccinelle/free/ifnullfree.cocci b/scripts/coccinelle/free/ifnullfree.cocci
index d4a072d..52bd235 100644
--- a/scripts/coccinelle/free/ifnullfree.cocci
+++ b/scripts/coccinelle/free/ifnullfree.cocci
@@ -25,6 +25,12 @@ expression E;
   debugfs_remove_recursive(E);
 |
   usb_free_urb(E);
+|
+  kmem_cache_destroy(E);
+|
+  mempool_destroy(E);
+|
+  dma_pool_destroy(E);
 )
 
 @r depends on context || report || org @
@@ -33,7 +39,9 @@ position p;
 @@
 
 * if (E != NULL)
-*	\(kfree@p\|debugfs_remove@p\|debugfs_remove_recursive@p\|usb_free_urb@p\)(E);
+*	\(kfree@p\|debugfs_remove@p\|debugfs_remove_recursive@p\|
+*         usb_free_urb@p\|kmem_cache_destroy@p\|mempool_destroy@p\|
+*         dma_pool_destroy@p\)(E);
 
 @script:python depends on org@
 p << r.p;

