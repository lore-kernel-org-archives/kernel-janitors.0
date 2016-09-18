From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 12:50:56 +0000
Subject: [PATCH 1/6] firmware-qemu_fw_cfg: Use kmalloc_array() in fw_cfg_register_dir_entries()
Message-Id: <b24d8af1-7f1e-7e22-b56b-9ec123bc1de5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <a736b350-a691-c73b-b8e9-67c0bffb716a@users.sourceforge.net>
In-Reply-To: <a736b350-a691-c73b-b8e9-67c0bffb716a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: qemu-devel@nongnu.org, Gabriel Somlo <somlo@cmu.edu>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 09:39:31 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

* Delete the local variable "dir_size" which became unnecessary with
  this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firmware/qemu_fw_cfg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index 0e20116..e69653e 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -491,17 +491,17 @@ static int fw_cfg_register_dir_entries(void)
 	int ret = 0;
 	u32 count, i;
 	struct fw_cfg_file *dir;
-	size_t dir_size;
 
 	fw_cfg_read_blob(FW_CFG_FILE_DIR, &count, 0, sizeof(count));
 	count = be32_to_cpu(count);
-	dir_size = count * sizeof(struct fw_cfg_file);
-
-	dir = kmalloc(dir_size, GFP_KERNEL);
+	dir = kmalloc_array(count, sizeof(*dir), GFP_KERNEL);
 	if (!dir)
 		return -ENOMEM;
 
-	fw_cfg_read_blob(FW_CFG_FILE_DIR, dir, sizeof(count), dir_size);
+	fw_cfg_read_blob(FW_CFG_FILE_DIR,
+			 dir,
+			 sizeof(count),
+			 sizeof(*dir) * count);
 
 	for (i = 0; i < count; i++) {
 		dir[i].size = be32_to_cpu(dir[i].size);
-- 
2.10.0

