From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 May 2018 09:13:24 +0000
Subject: [PATCH] libata: zpodd: small read overflow in eject_tray()
Message-Id: <20180529091320.axeryttqycdexzm5@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We read from the cdb[] buffer in ata_exec_internal_sg().  It has to be
ATAPI_CDB_LEN (16) bytes long, but this buffer is only 12 bytes.

Fixes: 213342053db5 ("libata: handle power transition of ODD")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/ata/libata-zpodd.c b/drivers/ata/libata-zpodd.c
index de4ddd0e8550..b3ed8f9953a8 100644
--- a/drivers/ata/libata-zpodd.c
+++ b/drivers/ata/libata-zpodd.c
@@ -35,7 +35,7 @@ struct zpodd {
 static int eject_tray(struct ata_device *dev)
 {
 	struct ata_taskfile tf;
-	static const char cdb[] = {  GPCMD_START_STOP_UNIT,
+	static const char cdb[ATAPI_CDB_LEN] = {  GPCMD_START_STOP_UNIT,
 		0, 0, 0,
 		0x02,     /* LoEj */
 		0, 0, 0, 0, 0, 0, 0,
