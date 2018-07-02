From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Jul 2018 10:00:26 +0000
Subject: [PATCH] ide-tape: remove redundant variable buffer_size
Message-Id: <20180702100026.16007-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable buffer_size is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'buffer_size' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/ide/ide-tape.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/ide/ide-tape.c b/drivers/ide/ide-tape.c
index aee7b46d2330..34c1165226a4 100644
--- a/drivers/ide/ide-tape.c
+++ b/drivers/ide/ide-tape.c
@@ -1746,7 +1746,6 @@ static void idetape_setup(ide_drive_t *drive, idetape_tape_t *tape, int minor)
 {
 	unsigned long t;
 	int speed;
-	int buffer_size;
 	u16 *ctl = (u16 *)&tape->caps[12];
 
 	ide_debug_log(IDE_DBG_FUNC, "minor: %d", minor);
@@ -1781,7 +1780,6 @@ static void idetape_setup(ide_drive_t *drive, idetape_tape_t *tape, int minor)
 		*ctl /= 2;
 		tape->buffer_size = *ctl * tape->blk_size;
 	}
-	buffer_size = tape->buffer_size;
 
 	/* select the "best" DSC read/write polling freq */
 	speed = max(*(u16 *)&tape->caps[14], *(u16 *)&tape->caps[8]);
-- 
2.17.1

