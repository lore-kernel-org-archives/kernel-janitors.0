From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Fri, 23 Sep 2016 01:32:39 +0000
Subject: [PATCH 09/11 V2] staging: dgnc: rename dgnc_tty_uninit() to dgnc_cleanup_tty()
Message-Id: <20160923013239.GA32161@SEL-JYOUN-D1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: markh@compro.net, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The dgnc_tty_uninit() doesn't match with dgnc_tty_init() at all.
And also the dgnc_cleanup_tty() is only called for exiting the module.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
V2: the subject line was cut off, I put it completely.

 drivers/staging/dgnc/dgnc_driver.c | 2 +-
 drivers/staging/dgnc/dgnc_tty.c    | 4 ++--
 drivers/staging/dgnc/dgnc_tty.h    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index 81ce5c4..fd372d3 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -147,7 +147,7 @@ static void cleanup(bool sysfiles)
 
 	for (i = 0; i < dgnc_num_boards; ++i) {
 		dgnc_remove_ports_sysfiles(dgnc_board[i]);
-		dgnc_tty_uninit(dgnc_board[i]);
+		dgnc_cleanup_tty(dgnc_board[i]);
 		dgnc_cleanup_board(dgnc_board[i]);
 	}
 
diff --git a/drivers/staging/dgnc/dgnc_tty.c b/drivers/staging/dgnc/dgnc_tty.c
index 893f473..5befd28 100644
--- a/drivers/staging/dgnc/dgnc_tty.c
+++ b/drivers/staging/dgnc/dgnc_tty.c
@@ -387,12 +387,12 @@ void dgnc_tty_post_uninit(void)
 }
 
 /*
- * dgnc_tty_uninit()
+ * dgnc_cleanup_tty()
  *
  * Uninitialize the TTY portion of this driver.  Free all memory and
  * resources.
  */
-void dgnc_tty_uninit(struct dgnc_board *brd)
+void dgnc_cleanup_tty(struct dgnc_board *brd)
 {
 	int i = 0;
 
diff --git a/drivers/staging/dgnc/dgnc_tty.h b/drivers/staging/dgnc/dgnc_tty.h
index f065c8f..24c9a41 100644
--- a/drivers/staging/dgnc/dgnc_tty.h
+++ b/drivers/staging/dgnc/dgnc_tty.h
@@ -25,7 +25,7 @@ int	dgnc_tty_preinit(void);
 int     dgnc_tty_init(struct dgnc_board *);
 
 void	dgnc_tty_post_uninit(void);
-void	dgnc_tty_uninit(struct dgnc_board *);
+void	dgnc_cleanup_tty(struct dgnc_board *);
 
 void	dgnc_input(struct channel_t *ch);
 void	dgnc_carrier(struct channel_t *ch);
-- 
1.9.1

