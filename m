From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 19:22:32 +0000
Subject: [PATCH 2/3] pstore: Improve a size determination in three functions
Message-Id: <23798ef4-5559-3454-ecf4-e6844b644ff3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97737d95-d6aa-d24f-1af0-9d4895ceaed2@users.sourceforge.net>
In-Reply-To: <97737d95-d6aa-d24f-1af0-9d4895ceaed2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 20:50:15 +0200

Replace the specification of data types by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/pstore/ram.c      | 3 +--
 fs/pstore/ram_core.c | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 42d27e5fac9f..0ef95c384bed 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -293,8 +293,7 @@ static ssize_t ramoops_pstore_read(struct pstore_record *record)
 			 */
 			struct persistent_ram_zone *tmp_prz, *prz_next;
 
-			tmp_prz = kzalloc(sizeof(struct persistent_ram_zone),
-					  GFP_KERNEL);
+			tmp_prz = kzalloc(sizeof(*tmp_prz), GFP_KERNEL);
 			if (!tmp_prz)
 				return -ENOMEM;
 			free_prz = true;
diff --git a/fs/pstore/ram_core.c b/fs/pstore/ram_core.c
index fafa8af1289c..5d9f7280d757 100644
--- a/fs/pstore/ram_core.c
+++ b/fs/pstore/ram_core.c
@@ -405,7 +405,7 @@ static void *persistent_ram_vmap(phys_addr_t start, size_t size,
 	else
 		prot = pgprot_writecombine(PAGE_KERNEL);
 
-	pages = kmalloc_array(page_count, sizeof(struct page *), GFP_KERNEL);
+	pages = kmalloc_array(page_count, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return NULL;
 
@@ -520,7 +520,7 @@ struct persistent_ram_zone *persistent_ram_new(phys_addr_t start, size_t size,
 	struct persistent_ram_zone *prz;
 	int ret = -ENOMEM;
 
-	prz = kzalloc(sizeof(struct persistent_ram_zone), GFP_KERNEL);
+	prz = kzalloc(sizeof(*prz), GFP_KERNEL);
 	if (!prz)
 		goto err;
 
-- 
2.14.0

