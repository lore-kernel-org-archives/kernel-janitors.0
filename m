From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 16:06:41 +0000
Subject: [PATCH] z2ram: Delete four error messages for a failed memory allocation in z2_open()
Message-Id: <83b6c012-07ca-39df-cfd4-0c4791ecda3d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@fb.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Aug 2017 17:56:53 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/z2ram.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
index 41c95c9b2ab4..66af886cb0a0 100644
--- a/drivers/block/z2ram.c
+++ b/drivers/block/z2ram.c
@@ -199,12 +199,8 @@ static int z2_open(struct block_device *bdev, fmode_t mode)
 		z2ram_map = 
 			kmalloc((size/Z2RAM_CHUNKSIZE)*sizeof(z2ram_map[0]),
 				GFP_KERNEL);
-		if ( z2ram_map = NULL )
-		{
-		    printk( KERN_ERR DEVICE_NAME
-			": cannot get mem for z2ram_map\n" );
+		if (!z2ram_map)
 		    goto err_out;
-		}
 
 		while (size) {
 			z2ram_map[ z2ram_size++ ] = vaddr;
@@ -224,12 +220,8 @@ static int z2_open(struct block_device *bdev, fmode_t mode)
 	    case Z2MINOR_COMBINED:
 
 		z2ram_map = kmalloc( max_z2_map + max_chip_map, GFP_KERNEL );
-		if ( z2ram_map = NULL )
-		{
-		    printk( KERN_ERR DEVICE_NAME
-			": cannot get mem for z2ram_map\n" );
+		if (!z2ram_map)
 		    goto err_out;
-		}
 
 		get_z2ram();
 		get_chipram();
@@ -245,12 +237,8 @@ static int z2_open(struct block_device *bdev, fmode_t mode)
 
     	    case Z2MINOR_Z2ONLY:
 		z2ram_map = kmalloc( max_z2_map, GFP_KERNEL );
-		if ( z2ram_map = NULL )
-		{
-		    printk( KERN_ERR DEVICE_NAME
-			": cannot get mem for z2ram_map\n" );
+		if (!z2ram_map)
 		    goto err_out;
-		}
 
 		get_z2ram();
 
@@ -263,12 +251,8 @@ static int z2_open(struct block_device *bdev, fmode_t mode)
 
 	    case Z2MINOR_CHIPONLY:
 		z2ram_map = kmalloc( max_chip_map, GFP_KERNEL );
-		if ( z2ram_map = NULL )
-		{
-		    printk( KERN_ERR DEVICE_NAME
-			": cannot get mem for z2ram_map\n" );
+		if (!z2ram_map)
 		    goto err_out;
-		}
 
 		get_chipram();
 
-- 
2.13.4

