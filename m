From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 Nov 2012 15:11:26 +0000
Subject: [patch] UBIFS: use kmalloc_array() in recomp_data_node()
Message-Id: <20121117151126.GA16900@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>

Using kmalloc_array() is a cleanup and it includes a check for integer
overflows.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index afaad07..23c2a20 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1104,7 +1104,7 @@ static int recomp_data_node(struct ubifs_data_node *dn, int *new_len)
 	int err, len, compr_type, out_len;
 
 	out_len = le32_to_cpu(dn->size);
-	buf = kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
+	buf = kmalloc_array(out_len, WORST_COMPR_FACTOR, GFP_NOFS);
 	if (!buf)
 		return -ENOMEM;
 
