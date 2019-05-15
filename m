From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 May 2019 09:38:33 +0000
Subject: [PATCH] staging: vc04_services: prevent integer overflow in create_pagelist()
Message-Id: <20190515093831.GE3409@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The create_pagelist() "count" parameter comes from the user in
vchiq_ioctl() and it could overflow.  If you look at how create_page()
is called in vchiq_prepare_bulk_data(), then the "size" variable is an
int so it doesn't make sense to allow negatives or larger than INT_MAX.

I don't know this code terribly well, but I believe that typical values
of "count" are typically quite low and I don't think this check will
affect normal valid uses at all.

The "pagelist_size" calculation can also overflow on 32 bit systems, but
not on 64 bit systems.  I have added an integer overflow check for that
as well.

The Raspberry PI doesn't offer the same level of memory protection that
x86 does so these sorts of bugs are probably not super critical to fix.

Fixes: 71bad7f08641 ("staging: add bcm2708 vchiq driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_2835_arm.c   | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
index a9a22917ecdb..a5b5840ff91a 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_2835_arm.c
@@ -368,9 +368,18 @@ create_pagelist(char __user *buf, size_t count, unsigned short type)
 	int dma_buffers;
 	dma_addr_t dma_addr;
 
+	if (count >= INT_MAX - PAGE_SIZE)
+		return NULL;
+
 	offset = ((unsigned int)(unsigned long)buf & (PAGE_SIZE - 1));
 	num_pages = DIV_ROUND_UP(count + offset, PAGE_SIZE);
 
+	if (num_pages > (SIZE_MAX - sizeof(struct pagelist) -
+			 sizeof(struct vchiq_pagelist_info)) /
+			(sizeof(u32) + sizeof(pages[0]) +
+			 sizeof(struct scatterlist)))
+		return NULL;
+
 	pagelist_size = sizeof(struct pagelist) +
 			(num_pages * sizeof(u32)) +
 			(num_pages * sizeof(pages[0]) +
-- 
2.20.1
