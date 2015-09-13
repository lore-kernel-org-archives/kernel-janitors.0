From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:17 +0000
Subject: [PATCH 24/39] dlm: drop null test before destroy functions
Message-Id: <1442146532-9100-25-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christine Caulfield <ccaulfie@redhat.com>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, David Teigland <teigland@redhat.com>, cluster-devel@redhat.com, linux-kernel@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 fs/dlm/memory.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/memory.c b/fs/dlm/memory.c
index 7cd24bc..0349c89 100644
--- a/fs/dlm/memory.c
+++ b/fs/dlm/memory.c
@@ -38,10 +38,8 @@ int __init dlm_memory_init(void)
 
 void dlm_memory_exit(void)
 {
-	if (lkb_cache)
-		kmem_cache_destroy(lkb_cache);
-	if (rsb_cache)
-		kmem_cache_destroy(rsb_cache);
+	kmem_cache_destroy(lkb_cache);
+	kmem_cache_destroy(rsb_cache);
 }
 
 char *dlm_allocate_lvb(struct dlm_ls *ls)

