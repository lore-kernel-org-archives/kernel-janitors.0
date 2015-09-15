From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Sep 2015 06:54:33 +0000
Subject: [patch] staging: wilc1000: off by one in get_handler_from_id()
Message-Id: <20150915065433.GA4811@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The > should be >= here or we read beyond the end of the array.

Fixes: d42ab0838d04 ('staging: wilc1000: use id value as argument')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index 59a1a9d..621fd18 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -637,7 +637,7 @@ static int get_id_from_handler(tstrWILC_WFIDrv *handler)
 
 static tstrWILC_WFIDrv *get_handler_from_id(int id)
 {
-	if (id <= 0 || id > ARRAY_SIZE(wfidrv_list))
+	if (id <= 0 || id >= ARRAY_SIZE(wfidrv_list))
 		return NULL;
 	return wfidrv_list[id];
 }
