From: Colin King <colin.king@canonical.com>
Date: Mon, 30 Jul 2018 13:34:55 +0000
Subject: [PATCH] fsi: master-ast-cf: fix spelling mistake: "firwmare" -> "firmware"
Message-Id: <20180730133455.7881-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/fsi/fsi-master-ast-cf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-ast-cf.c b/drivers/fsi/fsi-master-ast-cf.c
index 04d10ea8d343..85d9be38b32b 100644
--- a/drivers/fsi/fsi-master-ast-cf.c
+++ b/drivers/fsi/fsi-master-ast-cf.c
@@ -838,7 +838,7 @@ static int load_copro_firmware(struct fsi_master_acf *master)
 	rc = request_firmware(&fw, FW_FILE_NAME, master->dev);
 	if (rc) {
 		dev_err(
-			master->dev, "Error %d to load firwmare '%s' !\n",
+			master->dev, "Error %d to load firmware '%s' !\n",
 			rc, FW_FILE_NAME);
 		return rc;
 	}
-- 
2.17.1

