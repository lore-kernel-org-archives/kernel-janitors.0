From: Colin King <colin.king@canonical.com>
Date: Tue, 16 Apr 2019 18:05:56 +0000
Subject: [PATCH] mfd: ab8500-debugfs: fix spelling mistake "intefer" -> "interfere"
Message-Id: <20190416180556.18458-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_warn message, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mfd/ab8500-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/ab8500-debugfs.c b/drivers/mfd/ab8500-debugfs.c
index 8d652b2f9d14..8394a0712ac6 100644
--- a/drivers/mfd/ab8500-debugfs.c
+++ b/drivers/mfd/ab8500-debugfs.c
@@ -1600,7 +1600,7 @@ static int ab8500_modem_show(struct seq_file *s, void *p)
 	u32 reg;
 
 	ab8500 = dev_get_drvdata(dev->parent);
-	dev_warn(dev, "WARNING! This operation can interfer with modem side\n"
+	dev_warn(dev, "WARNING! This operation can interfere with modem side\n"
 		"and should only be done with care\n");
 
 	err = abx500_get_register_interruptible(dev,
-- 
2.20.1
