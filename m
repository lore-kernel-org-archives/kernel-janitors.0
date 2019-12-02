From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Dec 2019 16:48:33 +0000
Subject: [PATCH] ocfs2/dlm: remove redundant assignment to ret
Message-Id: <20191202164833.62865-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>, ocfs2-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never
read and it is being updated later with a new value.  The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ocfs2/dlm/dlmrecovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/dlm/dlmrecovery.c b/fs/ocfs2/dlm/dlmrecovery.c
index 064ce5bbc3f6..2734867473a6 100644
--- a/fs/ocfs2/dlm/dlmrecovery.c
+++ b/fs/ocfs2/dlm/dlmrecovery.c
@@ -1668,7 +1668,7 @@ static int dlm_lockres_master_requery(struct dlm_ctxt *dlm,
 int dlm_do_master_requery(struct dlm_ctxt *dlm, struct dlm_lock_resource *res,
 			  u8 nodenum, u8 *real_master)
 {
-	int ret = -EINVAL;
+	int ret;
 	struct dlm_master_requery req;
 	int status = DLM_LOCK_RES_OWNER_UNKNOWN;
 
-- 
2.24.0
