From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 08:44:50 +0000
Subject: [PATCH 07/10] dlm: Use kmalloc_array() in make_member_array()
Message-Id: <d35ccada-c558-3ab1-1828-5c95b668f45c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
In-Reply-To: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 09:19:17 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/dlm/member.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 9c47f1c14a8b..89257699d4e4 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -405,8 +405,7 @@ static void make_member_array(struct dlm_ls *ls)
 	}
 
 	ls->ls_total_weight = total;
-
-	array = kmalloc(sizeof(int) * total, GFP_NOFS);
+	array = kmalloc_array(total, sizeof(*array), GFP_NOFS);
 	if (!array)
 		return;
 
-- 
2.12.2

