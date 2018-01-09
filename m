From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Jan 2018 09:34:35 +0000
Subject: [PATCH] slimbus: Unlock on error path in slim_msg_response()
Message-Id: <20180109093435.4n45kxibmpvpb5i2@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sagar Dharia <sdharia@codeaurora.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

We need to unlock and restore IRQs before returning on this error path.

Fixes afbdcc7c384b0 ("slimbus: Add messaging APIs to slimbus framework")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/slimbus/messaging.c b/drivers/slimbus/messaging.c
index 755462a4c75e..94818a8427e2 100644
--- a/drivers/slimbus/messaging.c
+++ b/drivers/slimbus/messaging.c
@@ -36,6 +36,7 @@ void slim_msg_response(struct slim_controller *ctrl, u8 *reply, u8 tid, u8 len)
 
 	msg = txn->msg;
 	if (msg = NULL || msg->rbuf = NULL) {
+		spin_unlock_irqrestore(&ctrl->txn_lock, flags);
 		dev_err(ctrl->dev, "Got response to invalid TID:%d, len:%d\n",
 				tid, len);
 		return;
