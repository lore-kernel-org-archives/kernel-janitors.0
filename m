From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 08:48:35 +0000
Subject: [PATCH 10/10] dlm: Delete an unnecessary variable initialisation in dlm_ls_start()
Message-Id: <c0122498-4a7f-d5f3-9a73-0f804d3b07d2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
In-Reply-To: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 09:56:55 +0200

The local variable "rv" is reassigned by a statement at the beginning.
Thus omit the explicit initialisation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/dlm/member.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 3e565034ff2e..3fda3832cf6a 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -670,7 +670,7 @@ int dlm_ls_stop(struct dlm_ls *ls)
 
 int dlm_ls_start(struct dlm_ls *ls)
 {
-	struct dlm_recover *rv = NULL, *rv_old;
+	struct dlm_recover *rv, *rv_old;
 	struct dlm_config_node *nodes;
 	int error, count;
 
-- 
2.12.2

