From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 06:10:45 +0000
Subject: [PATCH 01/] firewire-net: Use kmalloc_array() in fwnet_broadcast_start()
Message-Id: <d0a380d4-a0a5-137c-054f-ac14d441f2af@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
In-Reply-To: <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux1394-devel@lists.sourceforge.net, Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 17 Sep 2016 21:55:42 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/net.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index 309311b..7911f13 100644
--- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -1103,8 +1103,7 @@ static int fwnet_broadcast_start(struct fwnet_device *dev)
 
 	max_receive = 1U << (dev->card->max_receive + 1);
 	num_packets = (FWNET_ISO_PAGE_COUNT * PAGE_SIZE) / max_receive;
-
-	ptrptr = kmalloc(sizeof(void *) * num_packets, GFP_KERNEL);
+	ptrptr = kmalloc_array(num_packets, sizeof(*ptrptr), GFP_KERNEL);
 	if (!ptrptr) {
 		retval = -ENOMEM;
 		goto failed;
-- 
2.10.0

