From: Nicholas Mc Guire <der.herr@hofr.at>
Date: Mon, 16 Dec 2013 17:22:07 +0000
Subject: [PATCH 3/6] consolidate spin_lock/unlock waiting with spin_unlock_wait
Message-Id: <20131216172207.GD15665@opentech.at>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


fs/fscache/object.c
consolidate spin_lock/unlock waiting with spin_unlock_wait()

config: x86_64_defconfig
toolchain: debian wheezy default x86_64-linux-gnu 4.4.5

Builds object.o without warnings.
runs on x86_64 but no specific test case for this change

CC: David Howells <dhowells@redhat.com>
Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>
---
 fs/fscache/object.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index 53d35c5..43e1331 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -692,8 +692,7 @@ static const struct fscache_state *fscache_drop_object(struct fscache_object *ob
 	/* Prevent a race with our last child, which has to signal EV_CLEARED
 	 * before dropping our spinlock.
 	 */
-	spin_lock(&object->lock);
-	spin_unlock(&object->lock);
+	spin_unlock_wait(&object->lock);
 
 	/* Discard from the cache's collection of objects */
 	spin_lock(&cache->object_list_lock);
-- 
1.7.2.5

