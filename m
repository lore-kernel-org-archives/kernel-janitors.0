From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:09:44 +0000
Subject: [patch] afs: unmapping the wrong buffer
Message-Id: <20161012060944.GG12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We switched from kmap_atomic() to kmap() so the kunmap() calls need to
be updated to match.

Fixes: d001648ec7cf ('rxrpc: Don't expose skbs to in-kernel users [ver #2]')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/afs/fsclient.c b/fs/afs/fsclient.c
index 96f4d76..31c616a 100644
--- a/fs/afs/fsclient.c
+++ b/fs/afs/fsclient.c
@@ -364,7 +364,7 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 			buffer = kmap(page);
 			ret = afs_extract_data(call, buffer,
 					       call->count, true);
-			kunmap(buffer);
+			kunmap(page);
 			if (ret < 0)
 				return ret;
 		}
@@ -397,7 +397,7 @@ static int afs_deliver_fs_fetch_data(struct afs_call *call)
 		page = call->reply3;
 		buffer = kmap(page);
 		memset(buffer + call->count, 0, PAGE_SIZE - call->count);
-		kunmap(buffer);
+		kunmap(page);
 	}
 
 	_leave(" = 0 [done]");
