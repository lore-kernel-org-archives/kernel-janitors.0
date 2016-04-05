From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Tue, 05 Apr 2016 09:30:02 +0000
Subject: [PATCH 2/2] staging: dgnc: remove redundant NULL check in
Message-Id: <20160405093002.GA25395@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

There were already checking NULL about channel_t / un_t
before calling dgnc_maxcps_room().

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_tty.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index e97faaa..200d3aa 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -1536,19 +1536,8 @@ static int dgnc_tty_chars_in_buffer(struct tty_struct *tty)
  */
 static int dgnc_maxcps_room(struct tty_struct *tty, int bytes_available)
 {
-	struct channel_t *ch = NULL;
-	struct un_t *un = NULL;
-
-	if (!tty)
-		return bytes_available;
-
-	un = tty->driver_data;
-	if (!un || un->magic != DGNC_UNIT_MAGIC)
-		return bytes_available;
-
-	ch = un->un_ch;
-	if (!ch || ch->magic != DGNC_CHANNEL_MAGIC)
-		return bytes_available;
+	struct un_t *un = tty->driver_data;
+	struct channel_t *ch = un->un_ch;
 
 	/*
 	 * If its not the Transparent print device, return
-- 
1.9.1

