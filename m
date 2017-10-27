From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Oct 2017 16:08:15 +0000
Subject: [PATCH] memstick: remove redundant pointer data
Message-Id: <20171027160815.13421-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Dubov <oakad@yahoo.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'data' is assigned but never read; it is redundant and can
be removed.  Cleans up clang warning:

drivers/memstick/host/tifm_ms.c:266:2: warning: Value stored to 'data'
is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/memstick/host/tifm_ms.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm_ms.c
index 7bafa72f8f57..54c0029a529d 100644
--- a/drivers/memstick/host/tifm_ms.c
+++ b/drivers/memstick/host/tifm_ms.c
@@ -254,7 +254,6 @@ static unsigned int tifm_ms_transfer_data(struct tifm_ms *host)
 static int tifm_ms_issue_cmd(struct tifm_ms *host)
 {
 	struct tifm_dev *sock = host->dev;
-	unsigned char *data;
 	unsigned int data_len, cmd, sys_param;
 
 	host->cmd_flags = 0;
@@ -262,9 +261,6 @@ static int tifm_ms_issue_cmd(struct tifm_ms *host)
 	host->io_pos = 0;
 	host->io_word = 0;
 	host->cmd_flags = 0;
-
-	data = host->req->data;
-
 	host->use_dma = !no_dma;
 
 	if (host->req->long_data) {
-- 
2.14.1

