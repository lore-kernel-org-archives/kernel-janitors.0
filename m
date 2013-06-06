From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Jun 2013 10:57:46 +0000
Subject: [patch -next] cw1200: handle allocation failure in wsm_event_indication()
Message-Id: <20130606105746.GE12953@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solomon Peachy <pizza@shaftnet.org>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Check for allocation failures and return -ENOMEM.  The caller
already expects it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/cw1200/wsm.c b/drivers/net/wireless/cw1200/wsm.c
index f3fd9b2..3ab25f6 100644
--- a/drivers/net/wireless/cw1200/wsm.c
+++ b/drivers/net/wireless/cw1200/wsm.c
@@ -929,6 +929,8 @@ static int wsm_event_indication(struct cw1200_common *priv, struct wsm_buf *buf)
 	}
 
 	event = kzalloc(sizeof(struct cw1200_wsm_event), GFP_KERNEL);
+	if (!event)
+		return -ENOMEM;
 
 	event->evt.id = __le32_to_cpu(WSM_GET32(buf));
 	event->evt.data = __le32_to_cpu(WSM_GET32(buf));
