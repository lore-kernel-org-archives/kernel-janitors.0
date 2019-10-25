From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Oct 2019 10:35:08 +0000
Subject: [PATCH] cifs: rename a variable in SendReceive()
Message-Id: <20191025103508.GA11916@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <sfrench@samba.org>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org

Smatch gets confused because we sometimes refer to "server->srv_mutex" and
sometimes to "sess->server->srv_mutex".  They refer to the same lock so
let's just make this consistent.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/transport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
index 308ad0f495e1..7c3697fe7905 100644
--- a/fs/cifs/transport.c
+++ b/fs/cifs/transport.c
@@ -1283,7 +1283,7 @@ SendReceive(const unsigned int xid, struct cifs_ses *ses,
 
 	rc = allocate_mid(ses, in_buf, &midQ);
 	if (rc) {
-		mutex_unlock(&ses->server->srv_mutex);
+		mutex_unlock(&server->srv_mutex);
 		/* Update # of requests on wire to server */
 		add_credits(server, &credits, 0);
 		return rc;
-- 
2.20.1
