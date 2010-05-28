From: Julia Lawall <julia@diku.dk>
Date: Fri, 28 May 2010 20:58:46 +0000
Subject: [PATCH] drivers/mfd: kzalloc doesn't return ERR_PTR
Message-Id: <Pine.LNX.4.64.1005282258050.27908@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use !x rather than IS_ERR(x) to test the result of kzalloc.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,E;
@@

x = \(kmalloc\|kzalloc\|kcalloc\)(...)
... when != x = E
- IS_ERR(x)
+ !x
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mfd/abx500-core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/mfd/abx500-core.c b/drivers/mfd/abx500-core.c
--- a/drivers/mfd/abx500-core.c
+++ b/drivers/mfd/abx500-core.c
@@ -36,7 +36,7 @@ int abx500_register_ops(struct device *d
 	struct abx500_device_entry *dev_entry;
 
 	dev_entry = kzalloc(sizeof(struct abx500_device_entry), GFP_KERNEL);
-	if (IS_ERR(dev_entry)) {
+	if (!dev_entry) {
 		dev_err(dev, "register_ops kzalloc failed");
 		return -ENOMEM;
 	}
