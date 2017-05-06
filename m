From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 08:47:10 +0000
Subject: [PATCH 09/10] dlm: Improve a size determination in two functions
Message-Id: <96e43ba3-1e9e-b598-f980-59751a720cc2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
In-Reply-To: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 09:45:59 +0200

Replace the specification of two data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/dlm/member.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/member.c b/fs/dlm/member.c
index 92c601a11e38..3e565034ff2e 100644
--- a/fs/dlm/member.c
+++ b/fs/dlm/member.c
@@ -318,7 +318,7 @@ static int dlm_add_member(struct dlm_ls *ls, struct dlm_config_node *node)
 	struct dlm_member *memb;
 	int error;
 
-	memb = kzalloc(sizeof(struct dlm_member), GFP_NOFS);
+	memb = kzalloc(sizeof(*memb), GFP_NOFS);
 	if (!memb)
 		return -ENOMEM;
 
@@ -674,7 +674,7 @@ int dlm_ls_start(struct dlm_ls *ls)
 	struct dlm_config_node *nodes;
 	int error, count;
 
-	rv = kzalloc(sizeof(struct dlm_recover), GFP_NOFS);
+	rv = kzalloc(sizeof(*rv), GFP_NOFS);
 	if (!rv)
 		return -ENOMEM;
 
-- 
2.12.2

