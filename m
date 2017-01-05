From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Jan 2017 12:46:35 +0000
Subject: [patch] ubifs: potential uninitialized variable in truncate_data_node()
Message-Id: <20170105124635.GA8525@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>, David Gstir <david@sigma-star.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org

GCC doesn't complain, but my static checker warns that if the data is
not compressed and not encrypted then "ret" isn't initialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index a459211a1c21..c54f04d88236 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1281,7 +1281,8 @@ static int truncate_data_node(const struct ubifs_info *c, const struct inode *in
 			      int *new_len)
 {
 	void *buf;
-	int err, dlen, compr_type, out_len, old_dlen;
+	int dlen, compr_type, out_len, old_dlen;
+	int err = 0;
 
 	out_len = le32_to_cpu(dn->size);
 	buf = kmalloc(out_len * WORST_COMPR_FACTOR, GFP_NOFS);
