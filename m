From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 12:55:14 +0000
Subject: [PATCH 4/6] firmware-qemu_fw_cfg: Improve a size determination in fw_cfg_build_symlink()
Message-Id: <24c61c19-c696-919b-8c4c-7e42d8ed5940@users.sourceforge.net>
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
Date: Sun, 18 Sep 2016 14:02:02 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firmware/qemu_fw_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index a834d01..a4b108a 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -399,7 +399,7 @@ static int fw_cfg_build_symlink(struct kset *dir,
 			dir = to_kset(ko);
 		} else {
 			/* create new subdirectory kset */
-			subdir = kzalloc(sizeof(struct kset), GFP_KERNEL);
+			subdir = kzalloc(sizeof(*subdir), GFP_KERNEL);
 			if (!subdir) {
 				ret = -ENOMEM;
 				break;
-- 
2.10.0

