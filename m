From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 08:39:22 +0000
Subject: [PATCH 03/10] dlm: Improve a size determination in table_seq_start()
Message-Id: <995aab89-a49a-fcf4-6d70-3b55580770e5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
In-Reply-To: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 08:34:27 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/dlm/debug_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 551e0f8dbe0d..fa08448e35dd 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -435,7 +435,7 @@ static void *table_seq_start(struct seq_file *seq, loff_t *pos)
 	if (bucket >= ls->ls_rsbtbl_size)
 		return NULL;
 
-	ri = kzalloc(sizeof(struct rsbtbl_iter), GFP_NOFS);
+	ri = kzalloc(sizeof(*ri), GFP_NOFS);
 	if (!ri)
 		return NULL;
 	if (n = 0)
-- 
2.12.2

