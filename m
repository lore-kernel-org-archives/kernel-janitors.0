From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 12:30:09 +0000
Subject: [PATCH] SUNRPC: Fix an error code in gss_alloc_msg()
Message-Id: <20190503123009.GC29695@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: Anna Schumaker <anna.schumaker@netapp.com>, "J. Bruce Fields" <bfields@fieldses.org>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neilb@suse.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org

If kstrdup_const() then this function returns zero (success) but it
should return -ENOMEM.

Fixes: ac83228a7101 ("SUNRPC: Use namespace of listening daemon in the client AUTH_GSS upcall")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/sunrpc/auth_gss/auth_gss.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/sunrpc/auth_gss/auth_gss.c b/net/sunrpc/auth_gss/auth_gss.c
index b2cbc83d39c7..06fe17c2aea1 100644
--- a/net/sunrpc/auth_gss/auth_gss.c
+++ b/net/sunrpc/auth_gss/auth_gss.c
@@ -553,8 +553,10 @@ gss_alloc_msg(struct gss_auth *gss_auth,
 	gss_msg->auth = gss_auth;
 	if (service_name) {
 		gss_msg->service_name = kstrdup_const(service_name, GFP_NOFS);
-		if (!gss_msg->service_name)
+		if (!gss_msg->service_name) {
+			err = -ENOMEM;
 			goto err_put_pipe_version;
+		}
 	}
 	return gss_msg;
 err_put_pipe_version:
-- 
2.18.0
