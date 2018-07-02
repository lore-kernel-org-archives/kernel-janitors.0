From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Jul 2018 13:27:35 +0000
Subject: [PATCH][staging-next] staging: rts5208: fix missing error check on call to rtsx_write_register
Message-Id: <20180702132735.14199-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gaurav Pathak <gauravpathak129@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check on error return from the call to rtsx_write_register
is checking the error status from the previous call. Fix this by adding
in the missing assignment of retval.

Detected by CoverityScan, CID#709877

Fixes: fa590c222fba ("staging: rts5208: add support for rts5208 and rts5288")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rts5208/sd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
index f2778abf10c0..e7efa34195c7 100644
--- a/drivers/staging/rts5208/sd.c
+++ b/drivers/staging/rts5208/sd.c
@@ -4690,7 +4690,7 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 			goto sd_execute_write_cmd_failed;
 		}
 
-		rtsx_write_register(chip, SD_BYTE_CNT_L, 0xFF, 0x00);
+		retval = rtsx_write_register(chip, SD_BYTE_CNT_L, 0xFF, 0x00);
 		if (retval != STATUS_SUCCESS) {
 			goto sd_execute_write_cmd_failed;
 		}
-- 
2.17.1

