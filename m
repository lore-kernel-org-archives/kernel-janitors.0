From: askb <askb23@gmail.com>
Date: Wed, 04 Nov 2009 06:55:30 +0000
Subject: [PATCH] mm/ksm.c - Fix compile warnings (PS ignore my formatting
Message-Id: <1257317010.14838.55.camel@linux-k65f.site>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Found the compiler warning on linux-next: 	

mm/ksm.c: In function ‘ksm_scan_thread’:
mm/ksm.c:1083: warning: ‘page2[0u]’ may be used uninitialized in this
function
mm/ksm.c:1083: note: ‘page2[0u]’ was declared here

fix for the above warning:

Signed-off-by: Anil SB <askb23@gmail.com>

diff --git a/mm/ksm.c b/mm/ksm.c
index bef1af4..2ea0fd3 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -1080,7 +1080,7 @@ static void stable_tree_append(struct rmap_item *rmap_item,
  */
 static void cmp_and_merge_page(struct page *page, struct rmap_item *rmap_item)
 {
-	struct page *page2[1];
+	struct page *page2[1] = {NULL};
 	struct rmap_item *tree_rmap_item;
 	unsigned int checksum;
 	int err;




