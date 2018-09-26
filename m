From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Sep 2018 10:39:34 +0000
Subject: [PATCH] 9p: potential NULL dereference
Message-Id: <20180926103934.GA14535@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>, Matthew Wilcox <willy@infradead.org>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet <asmadeus@codewreck.org>, "David S. Miller" <davem@davemloft.net>, v9fs-developer@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

p9_tag_alloc() is supposed to return error pointers, but we accidentally
return a NULL here.  It would cause a NULL dereference in the caller.

Fixes: 996d5b4db4b1 ("9p: Use a slab for allocating requests")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/9p/client.c b/net/9p/client.c
index 47fa6158a75a..5f23e18eecc0 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -281,7 +281,7 @@ p9_tag_alloc(struct p9_client *c, int8_t type, unsigned int max_size)
 	int tag;
 
 	if (!req)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	if (p9_fcall_init(c, &req->tc, alloc_msize))
 		goto free_req;
