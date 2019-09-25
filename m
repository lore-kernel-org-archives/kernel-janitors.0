From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Sep 2019 13:09:30 +0000
Subject: [PATCH] sunrpc: clean up indentation issue
Message-Id: <20190925130930.13076-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J . Bruce Fields" <bfields@fieldses.org>, Chuck Lever <chuck.lever@oracle.com>, Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, "David S . Miller" <davem@davemloft.net>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are statements that are indented incorrectly, remove the
extraneous spacing.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/sunrpc/svc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/sunrpc/svc.c b/net/sunrpc/svc.c
index 220b79988000..d11b70552c33 100644
--- a/net/sunrpc/svc.c
+++ b/net/sunrpc/svc.c
@@ -1233,8 +1233,8 @@ svc_generic_init_request(struct svc_rqst *rqstp,
 
 	if (rqstp->rq_vers >= progp->pg_nvers )
 		goto err_bad_vers;
-	  versp = progp->pg_vers[rqstp->rq_vers];
-	  if (!versp)
+	versp = progp->pg_vers[rqstp->rq_vers];
+	if (!versp)
 		goto err_bad_vers;
 
 	/*
-- 
2.20.1
