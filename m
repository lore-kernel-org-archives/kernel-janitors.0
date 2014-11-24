From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Nov 2014 17:24:22 +0000
Subject: [PATCH 4/6] f2fs: Fix typos for the word "destroy" in jump labels
Message-Id: <547369C6.2000004@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54736422.90409@users.sourceforge.net>
In-Reply-To: <54736422.90409@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Changman Lee <cm224.lee@samsung.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: kernel-janitors@vger.kernel.org, trivial@kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Nov 2014 15:52:00 +0100

Two jump labels were adjusted in the implementation of the
create_node_manager_caches() function because these identifiers
contained typos.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/f2fs/node.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 4537819..74f44fe 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2057,17 +2057,17 @@ int __init create_node_manager_caches(void)
 	free_nid_slab = f2fs_kmem_cache_create("free_nid",
 			sizeof(struct free_nid));
 	if (!free_nid_slab)
-		goto destory_nat_entry;
+		goto destroy_nat_entry;
 
 	nat_entry_set_slab = f2fs_kmem_cache_create("nat_entry_set",
 			sizeof(struct nat_entry_set));
 	if (!nat_entry_set_slab)
-		goto destory_free_nid;
+		goto destroy_free_nid;
 	return 0;
 
-destory_free_nid:
+destroy_free_nid:
 	kmem_cache_destroy(free_nid_slab);
-destory_nat_entry:
+destroy_nat_entry:
 	kmem_cache_destroy(nat_entry_slab);
 fail:
 	return -ENOMEM;
-- 
2.1.3

