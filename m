From: Colin King <colin.king@canonical.com>
Date: Tue, 02 Jun 2020 15:35:05 +0000
Subject: [PATCH][next] afs: fix double kfree on cell_name on error exit path
Message-Id: <20200602153505.64714-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error exit path is currently kfree'ing cell_name for a second time,
the previous kfree of this object occurred a statement earlier. Fix this
by removing it.

Addresses-Coverity: ("Double free")
Fixes: 6147fe6b7f8c ("afs: Detect cell aliases 3 - YFS Cells with a canonical cell name op")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/vl_alias.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/afs/vl_alias.c b/fs/afs/vl_alias.c
index 6c1cf702478e..093895c49c21 100644
--- a/fs/afs/vl_alias.c
+++ b/fs/afs/vl_alias.c
@@ -315,10 +315,8 @@ static int yfs_check_canonical_cell_name(struct afs_cell *cell, struct key *key)
 	master = afs_lookup_cell(cell->net, cell_name, strlen(cell_name),
 				 NULL, false);
 	kfree(cell_name);
-	if (IS_ERR(master)) {
-		kfree(cell_name);
+	if (IS_ERR(master))
 		return PTR_ERR(master);
-	}
 
 	cell->alias_of = master; /* Transfer our ref */
 	return 1;
-- 
2.25.1
