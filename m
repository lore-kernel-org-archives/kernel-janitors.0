From: Dan Carpenter <error27@gmail.com>
Date: Thu, 08 Jul 2010 12:49:38 +0000
Subject: [patch] ceph: add kfree() to error path
Message-Id: <20100708124938.GJ19184@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sage Weil <sage@newdream.net>
Cc: Noah Watkins <noah@noahdesu.com>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

We leak a "pi" on this error path.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/fs/ceph/osdmap.c b/fs/ceph/osdmap.c
index 50ce64e..277f8b3 100644
--- a/fs/ceph/osdmap.c
+++ b/fs/ceph/osdmap.c
@@ -568,6 +568,7 @@ struct ceph_osdmap *osdmap_decode(void **p, void *end)
 		if (ev > CEPH_PG_POOL_VERSION) {
 			pr_warning("got unknown v %d > %d of ceph_pg_pool\n",
 				   ev, CEPH_PG_POOL_VERSION);
+			kfree(pi);
 			goto bad;
 		}
 		__decode_pool(p, pi);
