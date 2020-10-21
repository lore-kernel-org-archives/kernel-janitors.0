From: Colin King <colin.king@canonical.com>
Date: Wed, 21 Oct 2020 13:11:33 +0000
Subject: [PATCH][next] afs: fix a dereference on pointer cell before cell is null checked
Message-Id: <20201021131133.128016-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-afs@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the assignment of debug_id dereferences pointer cell before
cell has been null checked.  Fix this by removing debug_id and use
cell->debug_id after cell has been null checked.

Addresses-Coverity: ("Dereference before null check")
Fixes: dca54a7bbb8c ("afs: Add tracing for cell refcount and active user count")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/afs/cell.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 52233fa6195f..4449ff100a3c 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -589,7 +589,6 @@ struct afs_cell *afs_use_cell(struct afs_cell *cell, enum afs_cell_trace reason)
  */
 void afs_unuse_cell(struct afs_net *net, struct afs_cell *cell, enum afs_cell_trace reason)
 {
-	unsigned int debug_id = cell->debug_id;
 	time64_t now, expire_delay;
 	int u, a;
 
@@ -606,7 +605,7 @@ void afs_unuse_cell(struct afs_net *net, struct afs_cell *cell, enum afs_cell_tr
 
 	u = atomic_read(&cell->ref);
 	a = atomic_dec_return(&cell->active);
-	trace_afs_cell(debug_id, u, a, reason);
+	trace_afs_cell(cell->debug_id, u, a, reason);
 	WARN_ON(a = 0);
 	if (a = 1)
 		/* 'cell' may now be garbage collected. */
-- 
2.27.0
