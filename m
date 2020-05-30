From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 30 May 2020 08:39:03 +0000
Subject: [PATCH] dlm: Fix a typo in a comment
Message-Id: <20200530083903.578271-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ccaulfie@redhat.com, teigland@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/locksapce/lockspace/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/dlm/lockspace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index e93670ecfae5..f17e091daab3 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -859,7 +859,7 @@ static int release_lockspace(struct dlm_ls *ls, int force)
  * until this returns.
  *
  * Force has 4 possible values:
- * 0 - don't destroy locksapce if it has any LKBs
+ * 0 - don't destroy lockspace if it has any LKBs
  * 1 - destroy lockspace if it has remote LKBs but not if it has local LKBs
  * 2 - destroy lockspace regardless of LKBs
  * 3 - destroy lockspace as part of a forced shutdown
-- 
2.25.1
