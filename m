From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Sep 2012 07:01:03 +0000
Subject: [patch] ACPI: free memory on an error path
Message-Id: <20120925070103.GA23009@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>, Lan Tianyu <tianyu.lan@intel.com>
Cc: linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

We should free "physical_node" if before returning the error code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.  Introduced in 1033f9041d5 "ACPI: Allow ACPI
binding with USB-3.0 hub".

diff --git a/drivers/acpi/glue.c b/drivers/acpi/glue.c
index d1a2d74..cfeecac 100644
--- a/drivers/acpi/glue.c
+++ b/drivers/acpi/glue.c
@@ -159,7 +159,7 @@ static int acpi_bind_one(struct device *dev, acpi_handle handle)
 	if (physical_node->node_id >= ACPI_MAX_PHYSICAL_NODE) {
 		retval = -ENOSPC;
 		mutex_unlock(&acpi_dev->physical_node_lock);
-		goto err;
+		goto free_node;
 	}
 
 	set_bit(physical_node->node_id, acpi_dev->physical_node_id_bitmap);
@@ -185,6 +185,8 @@ static int acpi_bind_one(struct device *dev, acpi_handle handle)
 
 	return 0;
 
+free_node:
+	kfree(physical_node);
  err:
 	put_device(dev);
 	return retval;
