From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 16:58:05 +0000
Subject: [PATCH 04] drivers/sbus/char/bbc_i2c.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311858.05485.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, davem@davemloft.net

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/sbus/char/bbc_i2c.c | 10847 -> 10823 (-24 bytes)

 drivers/sbus/char/bbc_i2c.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/sbus/char/bbc_i2c.c	2007-07-26 13:07:43.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/sbus/char/bbc_i2c.c	2007-07-31 18:12:13.000000000 +0200
@@ -357,13 +357,13 @@ static void __init reset_one_i2c(struct

 static int __init attach_one_i2c(struct linux_ebus_device *edev, int index)
 {
-	struct bbc_i2c_bus *bp = kmalloc(sizeof(*bp), GFP_KERNEL);
+	struct bbc_i2c_bus *bp;
 	struct linux_ebus_child *echild;
 	int entry;

+	bp = kzalloc(sizeof(*bp), GFP_KERNEL);
 	if (!bp)
 		return -ENOMEM;
-	memset(bp, 0, sizeof(*bp));

 	bp->i2c_control_regs = ioremap(edev->resource[0].start, 0x2);
 	if (!bp->i2c_control_regs)
