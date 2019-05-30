From: Colin King <colin.king@canonical.com>
Date: Thu, 30 May 2019 19:04:38 +0000
Subject: [PATCH] xen-netback: remove redundant assignment to err
Message-Id: <20190530190438.9571-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Liu <wei.liu2@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, "David S . Miller" <davem@davemloft.net>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is assigned with the value -ENOMEM that is never
read and it is re-assigned a new value later on.  The assignment is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/xen-netback/interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/xen-netback/interface.c b/drivers/net/xen-netback/interface.c
index 783198844dd7..240f762b3749 100644
--- a/drivers/net/xen-netback/interface.c
+++ b/drivers/net/xen-netback/interface.c
@@ -633,7 +633,7 @@ int xenvif_connect_data(struct xenvif_queue *queue,
 			unsigned int rx_evtchn)
 {
 	struct task_struct *task;
-	int err = -ENOMEM;
+	int err;
 
 	BUG_ON(queue->tx_irq);
 	BUG_ON(queue->task);
-- 
2.20.1
