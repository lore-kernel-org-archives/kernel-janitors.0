From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Feb 2012 10:49:34 +0000
Subject: [patch] bna: fix error handling of bnad_get_flash_partition_by_offset()
Message-Id: <20120209104934.GC5540@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasesh Mody <rmody@brocade.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The current error handling doesn't work because we flash_part is a u32
so the checks for negative error codes don't work.  I considered making
things signed but I don't know the hardware enough to say if that's a
problem.  Really, we don't use the error codes so just returning zero
for all problems is fine.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/brocade/bna/bnad_ethtool.c b/drivers/net/ethernet/brocade/bna/bnad_ethtool.c
index a27c601..ab753d7 100644
--- a/drivers/net/ethernet/brocade/bna/bnad_ethtool.c
+++ b/drivers/net/ethernet/brocade/bna/bnad_ethtool.c
@@ -946,7 +946,7 @@ bnad_get_flash_partition_by_offset(struct bnad *bnad, u32 offset,
 
 	flash_attr = kzalloc(sizeof(struct bfa_flash_attr), GFP_KERNEL);
 	if (!flash_attr)
-		return -ENOMEM;
+		return 0;
 
 	fcomp.bnad = bnad;
 	fcomp.comp_status = 0;
@@ -958,7 +958,7 @@ bnad_get_flash_partition_by_offset(struct bnad *bnad, u32 offset,
 	if (ret != BFA_STATUS_OK) {
 		spin_unlock_irqrestore(&bnad->bna_lock, flags);
 		kfree(flash_attr);
-		goto out_err;
+		return 0;
 	}
 	spin_unlock_irqrestore(&bnad->bna_lock, flags);
 	wait_for_completion(&fcomp.comp);
@@ -978,8 +978,6 @@ bnad_get_flash_partition_by_offset(struct bnad *bnad, u32 offset,
 	}
 	kfree(flash_attr);
 	return flash_part;
-out_err:
-	return -EINVAL;
 }
 
 static int
@@ -1006,7 +1004,7 @@ bnad_get_eeprom(struct net_device *netdev, struct ethtool_eeprom *eeprom,
 	/* Query the flash partition based on the offset */
 	flash_part = bnad_get_flash_partition_by_offset(bnad,
 				eeprom->offset, &base_offset);
-	if (flash_part <= 0)
+	if (flash_part = 0)
 		return -EFAULT;
 
 	fcomp.bnad = bnad;
@@ -1048,7 +1046,7 @@ bnad_set_eeprom(struct net_device *netdev, struct ethtool_eeprom *eeprom,
 	/* Query the flash partition based on the offset */
 	flash_part = bnad_get_flash_partition_by_offset(bnad,
 				eeprom->offset, &base_offset);
-	if (flash_part <= 0)
+	if (flash_part = 0)
 		return -EFAULT;
 
 	fcomp.bnad = bnad;
