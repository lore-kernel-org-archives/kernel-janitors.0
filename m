From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 03 Aug 2017 19:15:49 +0000
Subject: [PATCH 3/4] axonram: Return directly after a failed kzalloc() in axon_ram_probe()
Message-Id: <43bc7b50-b59b-89e9-9139-ae8a716016a7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <009fdef0-b2c9-5e98-d32d-14149aec92c5@users.sourceforge.net>
In-Reply-To: <009fdef0-b2c9-5e98-d32d-14149aec92c5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jan Kara <jack@suse.cz>, Jens Axboe <axboe@fb.com>, Dan Williams <dan.j.williams@intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 3 Aug 2017 20:23:57 +0200

* Return directly after a call of the function "kzalloc" failed
  at the beginning.

* Delete a repeated check for the local variable "bank"
  which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/sysdev/axonram.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/sysdev/axonram.c b/arch/powerpc/sysdev/axonram.c
index bf1506ec2ca4..93cc902350db 100644
--- a/arch/powerpc/sysdev/axonram.c
+++ b/arch/powerpc/sysdev/axonram.c
@@ -192,10 +192,8 @@ static int axon_ram_probe(struct platform_device *device)
 			device->dev.of_node->full_name);
 
 	bank = kzalloc(sizeof(*bank), GFP_KERNEL);
-	if (bank = NULL) {
-		rc = -ENOMEM;
-		goto failed;
-	}
+	if (!bank)
+		return -ENOMEM;
 
 	device->dev.platform_data = bank;
 
@@ -291,25 +289,22 @@ static int axon_ram_probe(struct platform_device *device)
 	return 0;
 
 failed:
-	if (bank != NULL) {
-		if (bank->irq_id)
-			free_irq(bank->irq_id, device);
-		if (bank->disk != NULL) {
-			if (bank->disk->major > 0)
-				unregister_blkdev(bank->disk->major,
-						bank->disk->disk_name);
-			if (bank->disk->flags & GENHD_FL_UP)
-				del_gendisk(bank->disk);
-			put_disk(bank->disk);
-		}
-		kill_dax(bank->dax_dev);
-		put_dax(bank->dax_dev);
-		device->dev.platform_data = NULL;
-		if (bank->io_addr != 0)
-			iounmap((void __iomem *) bank->io_addr);
-		kfree(bank);
+	if (bank->irq_id)
+		free_irq(bank->irq_id, device);
+	if (bank->disk != NULL) {
+		if (bank->disk->major > 0)
+			unregister_blkdev(bank->disk->major,
+					bank->disk->disk_name);
+		if (bank->disk->flags & GENHD_FL_UP)
+			del_gendisk(bank->disk);
+		put_disk(bank->disk);
 	}
-
+	kill_dax(bank->dax_dev);
+	put_dax(bank->dax_dev);
+	device->dev.platform_data = NULL;
+	if (bank->io_addr != 0)
+		iounmap((void __iomem *) bank->io_addr);
+	kfree(bank);
 	return rc;
 }
 
-- 
2.13.4

