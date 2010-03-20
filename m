From: Dan Carpenter <error27@gmail.com>
Date: Sat, 20 Mar 2010 11:19:38 +0000
Subject: [patch] afs: potential null dereference
Message-Id: <20100320111938.GT5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It seems clear from the surrounding code that xpermits is allowed to be 
NULL here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/afs/security.c b/fs/afs/security.c
index 3ef5043..bb4ed14 100644
--- a/fs/afs/security.c
+++ b/fs/afs/security.c
@@ -189,8 +189,9 @@ void afs_cache_permit(struct afs_vnode *vnode, struct key *key, long acl_order)
 	if (!permits)
 		goto out_unlock;
 
-	memcpy(permits->permits, xpermits->permits,
-	       count * sizeof(struct afs_permit));
+	if (xpermits)
+		memcpy(permits->permits, xpermits->permits,
+			count * sizeof(struct afs_permit));
 
 	_debug("key %x access %x",
 	       key_serial(key), vnode->status.caller_access);
