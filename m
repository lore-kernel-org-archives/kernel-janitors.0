From: Colin King <colin.king@canonical.com>
Date: Sun, 18 Aug 2019 18:53:49 +0000
Subject: [PATCH] NTB: ntb_transport: remove redundant assignment to rc
Message-Id: <20190818185349.15275-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, linux-ntb@googlegroups.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable rc is initialized to a value that is never read and it
is re-assigned later. The initialization is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/ntb/ntb_transport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ntb/ntb_transport.c b/drivers/ntb/ntb_transport.c
index 40c90ca10729..00a5d5764993 100644
--- a/drivers/ntb/ntb_transport.c
+++ b/drivers/ntb/ntb_transport.c
@@ -292,7 +292,7 @@ static int ntb_transport_bus_match(struct device *dev,
 static int ntb_transport_bus_probe(struct device *dev)
 {
 	const struct ntb_transport_client *client;
-	int rc = -EINVAL;
+	int rc;
 
 	get_device(dev);
 
-- 
2.20.1
