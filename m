From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Mar 2012 10:00:20 +0000
Subject: [patch] AFS: checking wrong bit in afs_readpages()
Message-Id: <20120307100020.GA25452@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should be testing "if (vnode->flags & (1 << 4))" instead of
"if (vnode->flags & 4) {".  The current test checks if the data was
modified instead of deleted.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/afs/file.c b/fs/afs/file.c
index 14d89fa..8f6e923 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -251,7 +251,7 @@ static int afs_readpages(struct file *file, struct address_space *mapping,
 	ASSERT(key != NULL);
 
 	vnode = AFS_FS_I(mapping->host);
-	if (vnode->flags & AFS_VNODE_DELETED) {
+	if (test_bit(AFS_VNODE_DELETED, &vnode->flags)) {
 		_leave(" = -ESTALE");
 		return -ESTALE;
 	}
