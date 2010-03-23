From: David Howells <dhowells@redhat.com>
Date: Tue, 23 Mar 2010 14:48:37 +0000
Subject: [PATCH] fscache: add missing unlock
Message-Id: <20100323144837.24147.90288.stgit@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: torvalds@osdl.org, akpm@linux-foundation.org
Cc: viro@zeniv.linux.org.uk, Trond.Myklebust@netapp.com, linux-cachefs@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>, David Howells <dhowells@redhat.com>

From: Dan Carpenter <error27@gmail.com>

Sparse complained about this missing spin_unlock()

Signed-off-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/fscache/page.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/fs/fscache/page.c b/fs/fscache/page.c
index c598ea4..6980902 100644
--- a/fs/fscache/page.c
+++ b/fs/fscache/page.c
@@ -881,6 +881,7 @@ submit_failed:
 	goto nobufs;
 
 nobufs_unlock_obj:
+	spin_unlock(&cookie->stores_lock);
 	spin_unlock(&object->lock);
 nobufs:
 	spin_unlock(&cookie->lock);

