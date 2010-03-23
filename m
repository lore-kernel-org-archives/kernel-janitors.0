From: Dan Carpenter <error27@gmail.com>
Date: Tue, 23 Mar 2010 11:26:29 +0000
Subject: [patch] fscache: add missing unlock
Message-Id: <20100323112629.GX21571@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: Steve Dickson <steved@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Trond Myklebust <Trond.Myklebust@netapp.com>, Daire Byrne <Daire.Byrne@framestore.com>, linux-cachefs@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Sparse complained about this missing spin_unlock()

Signed-off-by: Dan Carpenter <error27@gmail.com>

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
