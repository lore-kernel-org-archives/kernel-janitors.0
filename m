From: Alex Elder <elder@inktank.com>
Date: Tue, 19 Jun 2012 13:57:10 +0000
Subject: [PATCH] libceph: fix NULL dereference in reset_connection()
Message-Id: <4FE08536.9040807@inktank.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120619103339.GB7596@elgon.mountain> <4FE07E37.7000203@inktank.com> <20120619133316.GR4400@mwanda>
In-Reply-To: <20120619133316.GR4400@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sage Weil <sage@newdream.net>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

I have already incorporated the following in the Ceph master
branch (which is used for the -next build).  We will also send
this to Linus soon.

					-Alex
====
We dereference "con->in_msg" on the line after it was set to NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Alex Elder <elder@inktank.com>
---
 net/ceph/messenger.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/ceph/messenger.c b/net/ceph/messenger.c
index 5e9f61d..23073cf 100644
--- a/net/ceph/messenger.c
+++ b/net/ceph/messenger.c
@@ -440,7 +440,7 @@ static void reset_connection(struct ceph_connection
*con)
 		con->in_msg->con = NULL;
 		ceph_msg_put(con->in_msg);
 		con->in_msg = NULL;
-		ceph_con_put(con->in_msg->con);
+		ceph_con_put(con);
 	}

 	con->connect_seq = 0;



