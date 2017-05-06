From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 08:45:50 +0000
Subject: [PATCH 08/10] dlm: Use kcalloc() in two functions
Message-Id: <01b774a8-5f5a-8939-2b57-1fc99a864d11@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
In-Reply-To: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 09:34:53 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus reuse the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data structures by pointer dereferences
  to make the corresponding size determinations a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/dlm/member.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 89257699d4e4..92c601a11e38 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -217,8 +217,7 @@ int dlm_slots_assign(struct dlm_ls *ls, int *num_slots, int *slots_size,
 	}
 
 	array_size = max + need;
-
-	array = kzalloc(array_size * sizeof(struct dlm_slot), GFP_NOFS);
+	array = kcalloc(array_size, sizeof(*array), GFP_NOFS);
 	if (!array)
 		return -ENOMEM;
 
@@ -491,8 +490,7 @@ void dlm_lsop_recover_done(struct dlm_ls *ls)
 		return;
 
 	num = ls->ls_num_nodes;
-
-	slots = kzalloc(num * sizeof(struct dlm_slot), GFP_KERNEL);
+	slots = kcalloc(num, sizeof(*slots), GFP_KERNEL);
 	if (!slots)
 		return;
 
-- 
2.12.2

