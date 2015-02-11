From: Bas Peters <baspeters93@gmail.com>
Date: Wed, 11 Feb 2015 09:26:54 +0000
Subject: [PATCH] fs: dlm: lockspace.c: removal of unnecessary check before calling kfree()
Message-Id: <1423646814-22720-1-git-send-email-baspeters93@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ccaulfie@redhat.com, teigland@redhat.com
Cc: Bas Peters <baspeters93@gmail.com>, cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

kfree() checks its argument. It is therefore unnecessary to do this
twice.

This issue was detected using Coccinelle.

Signed-off-by: Bas Peters <baspeters93@gmail.com>
---
 fs/dlm/lockspace.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index f3e7278..b660b93 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -674,8 +674,7 @@ static int new_lockspace(const char *name, const char *cluster,
  out_lkbidr:
 	idr_destroy(&ls->ls_lkbidr);
 	for (i = 0; i < DLM_REMOVE_NAMES_MAX; i++) {
-		if (ls->ls_remove_names[i])
-			kfree(ls->ls_remove_names[i]);
+		kfree(ls->ls_remove_names[i]);
 	}
  out_rsbtbl:
 	vfree(ls->ls_rsbtbl);
-- 
2.1.0

