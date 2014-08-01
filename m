From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Aug 2014 08:23:57 +0000
Subject: [patch] dm9000: NULL dereferences on error in probe()
Message-Id: <20140801082357.GC28869@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andrew Ruder <andrew.ruder@elecsyscorp.com>, Nikita Kiryanov <nikita@compulab.co.il>, Igor Grinberg <grinberg@compulab.co.il>, Paul Gortmaker <paul.gortmaker@windriver.com>, Jingoo Han <jg1.han@samsung.com>, "Eric W. Biederman" <ebiederm@xmission.com>, Michael Abbott <michael.abbott@diamond.ac.uk>, Barry Song <Baohua.Song@csr.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The dm9000_release_board() function is called with NULL ->data_req and
->addr_req pointers if dm9000_probe() fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Old bug, but not serious.

diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethernet/davicom/dm9000.c
index 13723c9..23084fb 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -817,10 +817,12 @@ dm9000_release_board(struct platform_device *pdev, struct board_info *db)
 
 	/* release the resources */
 
-	release_resource(db->data_req);
+	if (db->data_req)
+		release_resource(db->data_req);
 	kfree(db->data_req);
 
-	release_resource(db->addr_req);
+	if (db->addr_req)
+		release_resource(db->addr_req);
 	kfree(db->addr_req);
 }
 
