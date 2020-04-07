From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Apr 2020 09:27:53 +0000
Subject: [PATCH] mailbox: imx: Fix return in imx_mu_scu_xlate()
Message-Id: <20200407092753.GH68494@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This called from mbox_request_channel().  The caller is  expecting error
pointers and not NULL so this "return NULL;" will lead to an Oops.

Fixes: 0a67003b1985 ("mailbox: imx: add SCU MU support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mailbox/imx-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 7906624a731c..9d6f0217077b 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -374,7 +374,7 @@ static struct mbox_chan *imx_mu_scu_xlate(struct mbox_controller *mbox,
 		break;
 	default:
 		dev_err(mbox->dev, "Invalid chan type: %d\n", type);
-		return NULL;
+		return ERR_PTR(-EINVAL);
 	}
 
 	if (chan >= mbox->num_chans) {
-- 
2.25.1
