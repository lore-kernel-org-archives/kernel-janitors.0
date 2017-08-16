From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 19:23:30 +0000
Subject: [PATCH 3/3] pstore: Adjust two checks for null pointers
Message-Id: <4fa42b22-6ef4-a9a3-2431-c51eeb320437@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97737d95-d6aa-d24f-1af0-9d4895ceaed2@users.sourceforge.net>
In-Reply-To: <97737d95-d6aa-d24f-1af0-9d4895ceaed2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 21:00:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/pstore/ram.c      | 2 +-
 fs/pstore/ram_core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 0ef95c384bed..38b81868f7f9 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -333,7 +333,7 @@ static ssize_t ramoops_pstore_read(struct pstore_record *record)
 	record->ecc_notice_size = persistent_ram_ecc_string(prz, NULL, 0);
 
 	record->buf = kmalloc(size + record->ecc_notice_size + 1, GFP_KERNEL);
-	if (record->buf = NULL) {
+	if (!record->buf) {
 		size = -ENOMEM;
 		goto out;
 	}
diff --git a/fs/pstore/ram_core.c b/fs/pstore/ram_core.c
index 5d9f7280d757..e37b2d0cb9f4 100644
--- a/fs/pstore/ram_core.c
+++ b/fs/pstore/ram_core.c
@@ -223,7 +223,7 @@ static int persistent_ram_init_ecc(struct persistent_ram_zone *prz,
 	 */
 	prz->rs_decoder = init_rs(prz->ecc_info.symsize, prz->ecc_info.poly,
 				  0, 1, prz->ecc_info.ecc_size);
-	if (prz->rs_decoder = NULL) {
+	if (!prz->rs_decoder) {
 		pr_info("init_rs failed\n");
 		return -EINVAL;
 	}
-- 
2.14.0

