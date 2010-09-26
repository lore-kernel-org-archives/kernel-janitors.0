From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 26 Sep 2010 08:59:47 +0000
Subject: [PATCH] touchscreen: tnetv107x: fix input_device leak
Message-Id: <1285491587-32707-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Cyril Chemparathy <cyril@ti.com>, Kevin Hilman <khilman@deeprootsystems.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org

tsc_probe() calls input_free_device() on error, but tsc_remove()
doesn't.
---
 drivers/input/touchscreen/tnetv107x-ts.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/input/touchscreen/tnetv107x-ts.c b/drivers/input/touchscreen/tnetv107x-ts.c
index cf1dba2..82d9a01 100644
--- a/drivers/input/touchscreen/tnetv107x-ts.c
+++ b/drivers/input/touchscreen/tnetv107x-ts.c
@@ -361,6 +361,7 @@ static int __devexit tsc_remove(struct platform_device *pdev)
 
 	input_unregister_device(ts->input_dev);
 	free_irq(ts->tsc_irq, ts);
+	input_free_device(ts->input_dev);
 	clk_put(ts->clk);
 	iounmap(ts->regs);
 	release_mem_region(ts->res->start, resource_size(ts->res));
-- 
1.7.0.4

