From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 02 Nov 2018 15:11:55 +0000
Subject: [PATCH] mailbox: hi3660: constify mbox_chan_ops structure
Message-Id: <1541171515-24331-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The mbox_chan_ops structure can be const as it is only stored in the
ops field of an mbox_controller structure and this field is const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mailbox/hi3660-mailbox.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
index 3eea6b642484..c3fd1f2b797f 100644
--- a/drivers/mailbox/hi3660-mailbox.c
+++ b/drivers/mailbox/hi3660-mailbox.c
@@ -206,7 +206,7 @@ static int hi3660_mbox_send_data(struct mbox_chan *chan, void *msg)
 	return 0;
 }
 
-static struct mbox_chan_ops hi3660_mbox_ops = {
+static const struct mbox_chan_ops hi3660_mbox_ops = {
 	.startup	= hi3660_mbox_startup,
 	.send_data	= hi3660_mbox_send_data,
 };
