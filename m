From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 08:40:19 +0000
Subject: [PATCH 04/10] dlm: Use kcalloc() in dlm_scan_waiters()
Message-Id: <9b591257-7dd1-97ca-b12d-55c963e0c528@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
In-Reply-To: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 08:38:49 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/dlm/lock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 6df332296c66..fd6fe55bedae 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -1426,7 +1426,7 @@ void dlm_scan_waiters(struct dlm_ls *ls)
 
 		if (!num_nodes) {
 			num_nodes = ls->ls_num_nodes;
-			warned = kzalloc(num_nodes * sizeof(int), GFP_KERNEL);
+			warned = kcalloc(num_nodes, sizeof(int), GFP_KERNEL);
 		}
 		if (!warned)
 			continue;
-- 
2.12.2

