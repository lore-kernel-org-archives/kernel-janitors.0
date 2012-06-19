From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Jun 2012 10:33:39 +0000
Subject: [patch -next] libceph: fix NULL dereference in reset_connection()
Message-Id: <20120619103339.GB7596@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sage Weil <sage@newdream.net>, Alex Elder <elder@inktank.com>
Cc: ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

We dereference "con->in_msg" on the line after it was set to NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ceph/messenger.c b/net/ceph/messenger.c
index 5e9f61d..6aa671c 100644
--- a/net/ceph/messenger.c
+++ b/net/ceph/messenger.c
@@ -437,10 +437,10 @@ static void reset_connection(struct ceph_connection *con)
 
 	if (con->in_msg) {
 		BUG_ON(con->in_msg->con != con);
+		ceph_con_put(con->in_msg->con);
 		con->in_msg->con = NULL;
 		ceph_msg_put(con->in_msg);
 		con->in_msg = NULL;
-		ceph_con_put(con->in_msg->con);
 	}
 
 	con->connect_seq = 0;
