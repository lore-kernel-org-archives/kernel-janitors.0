From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 24 Mar 2016 06:11:08 +0000
Subject: [PATCH 2/2] staging: dgnc: remove unused variable in dgnc_board
Message-Id: <20160324061108.GA12250@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

TtyRefCnt was not used anywhere in dgnc.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_driver.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.h b/drivers/staging/dgnc/dgnc_driver.h
index 3d8e15f..44216ae 100644
--- a/drivers/staging/dgnc/dgnc_driver.h
+++ b/drivers/staging/dgnc/dgnc_driver.h
@@ -213,8 +213,6 @@ struct dgnc_board {
 	uint		dgnc_serial_major;
 	uint		dgnc_transparent_print_major;
 
-	uint		TtyRefCnt;
-
 	u16		dpatype;	/* The board "type",
 					 * as defined by DPA
 					 */
-- 
1.9.1

