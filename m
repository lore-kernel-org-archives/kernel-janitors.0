From: askb <askb23@gmail.com>
Date: Wed, 04 Nov 2009 06:56:17 +0000
Subject: [PATCH] fs/ocfs2/stack_user.c - Fixing Compiler warning (PS ignore
Message-Id: <1257317057.14838.57.camel@linux-k65f.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1257302574.14838.22.camel@linux-k65f.site>
In-Reply-To: <1257302574.14838.22.camel@linux-k65f.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: mfasheh@suse.com, joel.becker@oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Found the following compile warning on linux-next:

fs/ocfs2/stack_user.c: In function ‘user_cluster_connect’:
fs/ocfs2/stack_user.c:817: warning: ‘control’ may be used uninitialized
in this function

fix for the above warning:

Signed-off-by: Anil SB <askb23@gmail.com>

diff --git a/fs/ocfs2/stack_user.c b/fs/ocfs2/stack_user.c
index ff4c798..858ef6f 100644
--- a/fs/ocfs2/stack_user.c
+++ b/fs/ocfs2/stack_user.c
@@ -814,7 +814,7 @@ static int fs_protocol_compare(struct ocfs2_protocol_version *existing,
 static int user_cluster_connect(struct ocfs2_cluster_connection *conn)
 {
 	dlm_lockspace_t *fsdlm;
-	struct ocfs2_live_connection *control;
+	struct ocfs2_live_connection *control = NULL;
 	int rc = 0;
 
 	BUG_ON(conn = NULL);




