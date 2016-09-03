From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 03 Sep 2016 05:35:29 +0000
Subject: [PATCH] jfs: Simplify code
Message-Id: <1472880929-29449-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Calling 'list_splice' followed by 'INIT_LIST_HEAD' is equivalent to
'list_splice_init'.

This has been spotted with the following coccinelle script:
/////
@@
expression y,z;
@@

-   list_splice(y,z);
-   INIT_LIST_HEAD(y);
+   list_splice_init(y,z);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/jfs/jfs_txnmgr.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_txnmgr.c b/fs/jfs/jfs_txnmgr.c
index 2e58978d6f45..4d973524c887 100644
--- a/fs/jfs/jfs_txnmgr.c
+++ b/fs/jfs/jfs_txnmgr.c
@@ -2893,8 +2893,7 @@ restart:
 	 * on anon_list2.  Let's check.
 	 */
 	if (!list_empty(&TxAnchor.anon_list2)) {
-		list_splice(&TxAnchor.anon_list2, &TxAnchor.anon_list);
-		INIT_LIST_HEAD(&TxAnchor.anon_list2);
+		list_splice_init(&TxAnchor.anon_list2, &TxAnchor.anon_list);
 		goto restart;
 	}
 	TXN_UNLOCK();
-- 
2.7.4

