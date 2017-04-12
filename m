From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Apr 2017 08:33:21 +0000
Subject: [PATCH] c2port: checking for NULL instead of IS_ERR()
Message-Id: <20170412083321.GC3250@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, Rodolfo Giometti <giometti@linux.it>
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

c2port_device_register() never returns NULL, it uses error pointers.

Fixes: 65131cd52b9e ("c2port: add c2port support for Eurotech Duramar 2150")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/c2port/c2port-duramar2150.c b/drivers/misc/c2port/c2port-duramar2150.c
index 5484301d57d9..3dc61ea7dc64 100644
--- a/drivers/misc/c2port/c2port-duramar2150.c
+++ b/drivers/misc/c2port/c2port-duramar2150.c
@@ -129,8 +129,8 @@ static int __init duramar2150_c2port_init(void)
 
 	duramar2150_c2port_dev = c2port_device_register("uc",
 					&duramar2150_c2port_ops, NULL);
-	if (!duramar2150_c2port_dev) {
-		ret = -ENODEV;
+	if (IS_ERR(duramar2150_c2port_dev)) {
+		ret = PTR_ERR(duramar2150_c2port_dev);
 		goto free_region;
 	}
 
