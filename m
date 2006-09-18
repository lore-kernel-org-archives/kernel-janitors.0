From: "Om Narasimhan" <om.turyx@gmail.com>
Date: Mon, 18 Sep 2006 00:53:42 +0000
Subject: [KJ] kmalloc to kzalloc patches for drivers/mfd
Message-Id: <6b4e42d10609171753m1836aaf3y52788c84a52d5e6a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Tested by compiling.

Signed off by Om Narasimhan <om.turyx@gmail.com>

 drivers/mfd/mcp-core.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/mcp-core.c b/drivers/mfd/mcp-core.c
index 75f401d..b4ed57e 100644
--- a/drivers/mfd/mcp-core.c
+++ b/drivers/mfd/mcp-core.c
@@ -200,9 +200,8 @@ struct mcp *mcp_host_alloc(struct device
 {
 	struct mcp *mcp;

-	mcp = kmalloc(sizeof(struct mcp) + size, GFP_KERNEL);
+	mcp = kzalloc(sizeof(struct mcp) + size, GFP_KERNEL);
 	if (mcp) {
-		memset(mcp, 0, sizeof(struct mcp) + size);
 		spin_lock_init(&mcp->lock);
 		mcp->attached_device.parent = parent;
 		mcp->attached_device.bus = &mcp_bus_type;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
