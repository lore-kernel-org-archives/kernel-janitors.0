From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 13 Jul 2010 11:23:12 +0000
Subject: [PATCH] wd: fix memory leak
Message-Id: <1279020192-9484-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Joe Perches <joe@perches.com>, netdev@vger.kernel.org

Unmap mapped IO in wd_probe1() if register_netdev() failed.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/wd.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/net/wd.c b/drivers/net/wd.c
index 746a5ee..eb72c67 100644
--- a/drivers/net/wd.c
+++ b/drivers/net/wd.c
@@ -358,8 +358,10 @@ static int __init wd_probe1(struct net_device *dev, int ioaddr)
 #endif
 
 	err = register_netdev(dev);
-	if (err)
+	if (err) {
 		free_irq(dev->irq, dev);
+		iounmap(ei_status.mem);
+	}
 	return err;
 }
 
-- 
1.7.0.4

