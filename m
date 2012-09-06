From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 06 Sep 2012 16:09:09 +0000
Subject: [PATCH 10/10] drivers/block/ataflop.c: removes unnecessary semicolon
Message-Id: <1346947757-10481-2-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346947757-10481-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1346947757-10481-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/block/ataflop.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/block/ataflop.c b/drivers/block/ataflop.c
--- a/drivers/block/ataflop.c
+++ b/drivers/block/ataflop.c
@@ -775,7 +775,7 @@ static void fd_calibrate( void )
 	}
 
 	if (ATARIHW_PRESENT(FDCSPEED))
-		dma_wd.fdc_speed = 0; 	/* always seek with 8 Mhz */;
+		dma_wd.fdc_speed = 0; 	/* always seek with 8 Mhz */
 	DPRINT(("fd_calibrate\n"));
 	SET_IRQ_HANDLER( fd_calibrate_done );
 	/* we can't verify, since the speed may be incorrect */

