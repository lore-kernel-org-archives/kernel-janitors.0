From: Colin King <colin.king@canonical.com>
Date: Thu, 11 Oct 2018 15:35:22 +0000
Subject: [PATCH] drivers: visorbus: fix memory leak on parser_ctx
Message-Id: <20181011153522.26237-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Kershner <david.kershner@unisys.com>, sparmaintainer@unisys.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to visorchannel_signalinsert fails the error
return path does not free parser_ctx.  Fix this by kfree'ing it on
the error return path.

Detected by CoverityScan, CID#1451916 ("Resource leak")

Fixes: a35e3268da51 ("staging: unisys: visorchipset: remove local_addr in handle_command")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/visorbus/visorchipset.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/visorbus/visorchipset.c b/drivers/visorbus/visorchipset.c
index ca752b8f495f..09d1536edfb1 100644
--- a/drivers/visorbus/visorchipset.c
+++ b/drivers/visorbus/visorchipset.c
@@ -1383,8 +1383,10 @@ static int handle_command(struct controlvm_message inmsg, u64 channel_addr)
 	controlvm_init_response(&ackmsg, &inmsg.hdr, CONTROLVM_RESP_SUCCESS);
 	err = visorchannel_signalinsert(chipset_dev->controlvm_channel,
 					CONTROLVM_QUEUE_ACK, &ackmsg);
-	if (err)
+	if (err) {
+		kfree(parser_ctx);
 		return err;
+	}
 	switch (inmsg.hdr.id) {
 	case CONTROLVM_CHIPSET_INIT:
 		err = chipset_init(&inmsg);
-- 
2.17.1
