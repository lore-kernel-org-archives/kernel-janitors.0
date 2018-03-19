From: Colin King <colin.king@canonical.com>
Date: Mon, 19 Mar 2018 11:41:01 +0000
Subject: [PATCH] ocfs2: fix spelling mistake: "Migrateable" -> "Migratable"
Message-Id: <20180319114101.2051-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, Andrew Morton <akpm@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in mlog message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/ocfs2/dlm/dlmmaster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ocfs2/dlm/dlmmaster.c b/fs/ocfs2/dlm/dlmmaster.c
index 03766fb41dbe..81d500211f43 100644
--- a/fs/ocfs2/dlm/dlmmaster.c
+++ b/fs/ocfs2/dlm/dlmmaster.c
@@ -2543,7 +2543,7 @@ static int dlm_is_lockres_migrateable(struct dlm_ctxt *dlm,
 			return 0;
 	}
 
-	mlog(0, "%s: res %.*s, Migrateable\n", dlm->name, res->lockname.len,
+	mlog(0, "%s: res %.*s, Migratable\n", dlm->name, res->lockname.len,
 	     res->lockname.name);
 
 	return 1;
-- 
2.15.1

