From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 20 May 2016 09:51:28 +0000
Subject: [PATCH 2/2] staging: dgnc: remove redundant null check in
Message-Id: <20160520095128.GA30102@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160405093002.GA25395@SEL-JYOUN-D1>
In-Reply-To: <20160405093002.GA25395@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

the "brd" was already checked for NULL before calling dgnc_do_remap().

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_driver.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index 22257d2..1882ef5 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -599,9 +599,6 @@ static int dgnc_finalize_board_init(struct dgnc_board *brd)
  */
 static void dgnc_do_remap(struct dgnc_board *brd)
 {
-	if (!brd || brd->magic != DGNC_BOARD_MAGIC)
-		return;
-
 	brd->re_map_membase = ioremap(brd->membase, 0x1000);
 }
 
-- 
1.9.1

