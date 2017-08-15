From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Aug 2017 12:01:11 +0000
Subject: [PATCH 3/5] net/9p: Add a jump target in p9_client_walk()
Message-Id: <5b39be44-cbec-9838-77c6-00b99f5fe0a2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <22a44d7c-cdb9-e206-4b2c-56e38cbf0de1@users.sourceforge.net>
In-Reply-To: <22a44d7c-cdb9-e206-4b2c-56e38cbf0de1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: v9fs-developer@lists.sourceforge.net, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric Van Hensbergen <ericvh@gmail.com>, Latchesar Ionkov <lucho@ionkov.net>, Ron Minnich <rminnich@sandia.gov>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Aug 2017 10:07:22 +0200

Replace a variable assignment by a goto statement so that an extra check
will be avoided at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/9p/client.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/9p/client.c b/net/9p/client.c
index 2ca55d4b0b7d..6c2fc796edfb 100644
--- a/net/9p/client.c
+++ b/net/9p/client.c
@@ -1237,12 +1237,11 @@ struct p9_fid *p9_client_walk(struct p9_fid *oldfid, uint16_t nwname,
 clunk_fid:
 	kfree(wqids);
 	p9_client_clunk(fid);
-	fid = NULL;
-
+	goto exit;
 error:
 	if (fid && (fid != oldfid))
 		p9_fid_destroy(fid);
-
+exit:
 	return ERR_PTR(err);
 }
 EXPORT_SYMBOL(p9_client_walk);
-- 
2.14.0

