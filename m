From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Jan 2018 17:54:22 +0000
Subject: [PATCH] ide: remove duplicated assignment to 'cursg'
Message-Id: <20180116175422.19722-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, linux-ide@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer cursg is initialized to cmd->cursg and again re-assigned the
same value a few lines later, hence the second assignment is redundant
and can be removed.

Cleans up clang warning:
drivers/ide/ide-taskfile.c:229:22: warning: Value stored to 'cursg'
during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/ide/ide-taskfile.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ide/ide-taskfile.c b/drivers/ide/ide-taskfile.c
index 4efe4c6e956c..abe0822dd429 100644
--- a/drivers/ide/ide-taskfile.c
+++ b/drivers/ide/ide-taskfile.c
@@ -232,7 +232,6 @@ void ide_pio_bytes(ide_drive_t *drive, struct ide_cmd *cmd,
 	unsigned int offset;
 	u8 *buf;
 
-	cursg = cmd->cursg;
 	if (cursg = NULL)
 		cursg = cmd->cursg = sg;
 
-- 
2.15.1

