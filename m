From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 08:41:13 +0000
Subject: [PATCH 1/2] usb: mtu3: fix memory corruption in mtu3_debugfs_regset()
Message-Id: <X8ikqc4Mo2/0G72j@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org

This code is using the wrong sizeof() so it does not allocate enough
memory.  It allocates 32 bytes but 72 are required.  That will lead to
memory corruption.

Fixes: ae07809255d3 ("usb: mtu3: add debugfs interface files")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/usb/mtu3/mtu3_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_debugfs.c b/drivers/usb/mtu3/mtu3_debugfs.c
index fdeade6254ae..7537bfd651af 100644
--- a/drivers/usb/mtu3/mtu3_debugfs.c
+++ b/drivers/usb/mtu3/mtu3_debugfs.c
@@ -127,7 +127,7 @@ static void mtu3_debugfs_regset(struct mtu3 *mtu, void __iomem *base,
 	struct debugfs_regset32 *regset;
 	struct mtu3_regset *mregs;
 
-	mregs = devm_kzalloc(mtu->dev, sizeof(*regset), GFP_KERNEL);
+	mregs = devm_kzalloc(mtu->dev, sizeof(*mregs), GFP_KERNEL);
 	if (!mregs)
 		return;
 
-- 
2.29.2
