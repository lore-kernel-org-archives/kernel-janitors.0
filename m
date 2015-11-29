From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Nov 2015 12:50:02 +0000
Subject: [PATCH] mailbox: constify mbox_chan_ops structure
Message-Id: <1448801402-27540-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This mbox_chan_ops structure is never modified, so declare it as const,
like all the other mbox_chan_ops structures.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mailbox/mailbox-sti.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-sti.c b/drivers/mailbox/mailbox-sti.c
index 4835817..2394cfe 100644
--- a/drivers/mailbox/mailbox-sti.c
+++ b/drivers/mailbox/mailbox-sti.c
@@ -384,7 +384,7 @@ static struct mbox_chan *sti_mbox_xlate(struct mbox_controller *mbox,
 	return chan;
 }
 
-static struct mbox_chan_ops sti_mbox_ops = {
+static const struct mbox_chan_ops sti_mbox_ops = {
 	.startup	= sti_mbox_startup_chan,
 	.shutdown	= sti_mbox_shutdown_chan,
 	.send_data	= sti_mbox_send_data,

