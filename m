From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 06:14:18 +0000
Subject: [PATCH 03/10] firewire-net: Rename jump labels in fwnet_init()
Message-Id: <3082f160-c1c8-6a47-020a-109c797ea4ea@users.sourceforge.net>
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
Date: Sat, 17 Sep 2016 22:11:25 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firewire/net.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
index 89afed3..cedfade 100644
--- a/drivers/firewire/net.c
+++ b/drivers/firewire/net.c
@@ -1662,14 +1662,14 @@ static int __init fwnet_init(void)
 #if IS_ENABLED(CONFIG_IPV6)
 	err = fw_core_add_descriptor(&rfc3146_unit_directory);
 	if (err)
-		goto out;
+		goto remove_descriptor_rfc2374;
 #endif
 
 	fwnet_packet_task_cache = kmem_cache_create("packet_task",
 			sizeof(struct fwnet_packet_task), 0, 0, NULL);
 	if (!fwnet_packet_task_cache) {
 		err = -ENOMEM;
-		goto out2;
+		goto remove_descriptor_rfc3146;
 	}
 
 	err = driver_register(&fwnet_driver.driver);
@@ -1677,10 +1677,10 @@ static int __init fwnet_init(void)
 		return 0;
 
 	kmem_cache_destroy(fwnet_packet_task_cache);
-out2:
+ remove_descriptor_rfc3146:
 #if IS_ENABLED(CONFIG_IPV6)
 	fw_core_remove_descriptor(&rfc3146_unit_directory);
-out:
+ remove_descriptor_rfc2374:
 #endif
 	fw_core_remove_descriptor(&rfc2374_unit_directory);
 
-- 
2.10.0

