From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Thu, 12 May 2016 11:11:39 +0000
Subject: [PATCH 1/3] staging: dgnc: remove redundant local variable for
Message-Id: <20160512111139.GA28271@certreview.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160504051304.GA20929@certreview.com>
In-Reply-To: <20160504051304.GA20929@certreview.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The local variable "bd" was not used in dgnc_carrier() function.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index a505775..52a1613 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -640,19 +640,12 @@ exit_unlock:
  ************************************************************************/
 void dgnc_carrier(struct channel_t *ch)
 {
-	struct dgnc_board *bd;
-
 	int virt_carrier = 0;
 	int phys_carrier = 0;
 
 	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
 		return;
 
-	bd = ch->ch_bd;
-
-	if (!bd || bd->magic != DGNC_BOARD_MAGIC)
-		return;
-
 	if (ch->ch_mistat & UART_MSR_DCD)
 		phys_carrier = 1;
 
-- 
2.8.2

