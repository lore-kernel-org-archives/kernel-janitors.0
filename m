From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Nov 2013 07:50:24 +0000
Subject: [patch] bus: mvebu-mbus: potential forever loop in mvebu_mbus_init()
Message-Id: <20131113075024.GH25541@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"of_id->compatible" is an array and not a pointer so it can never be
NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I'm not able to compile this.

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 2394e97..c646a76 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -734,11 +734,11 @@ int __init mvebu_mbus_init(const char *soc, phys_addr_t mbuswins_phys_base,
 {
 	const struct of_device_id *of_id;
 
-	for (of_id = of_mvebu_mbus_ids; of_id->compatible; of_id++)
+	for (of_id = of_mvebu_mbus_ids; of_id->compatible[0]; of_id++)
 		if (!strcmp(of_id->compatible, soc))
 			break;
 
-	if (!of_id->compatible) {
+	if (!of_id->compatible[0]) {
 		pr_err("could not find a matching SoC family\n");
 		return -ENODEV;
 	}
