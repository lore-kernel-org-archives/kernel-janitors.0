From: Dan Carpenter <error27@gmail.com>
Date: Thu, 21 Oct 2010 19:24:00 +0000
Subject: [patch 2/3] V4L/DVB: s5p-fimc: make it compile
Message-Id: <20101021192400.GK5985@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Pawel Osciak <p.osciak@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The work_queue was partially removed in f93000ac11: "[media] s5p-fimc:
mem2mem driver refactoring and cleanup" but this bit was missed.  Also
we need to include sched.h otherwise the compile fails with:

drivers/media/video/s5p-fimc/fimc-core.c:
	In function ‘fimc_capture_handler’:
drivers/media/video/s5p-fimc/fimc-core.c:286:
	error: ‘TASK_NORMAL’ undeclared (first use in this function)

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Compile tested only.                                       :P

diff --git a/drivers/media/video/s5p-fimc/fimc-core.h b/drivers/media/video/s5p-fimc/fimc-core.h
index e3a7c6a..1c1437c 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.h
+++ b/drivers/media/video/s5p-fimc/fimc-core.h
@@ -14,6 +14,7 @@
 /*#define DEBUG*/
 
 #include <linux/types.h>
+#include <linux/sched.h>
 #include <media/videobuf-core.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-mem2mem.h>
diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
index 8335045..cf9bc8e 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.c
+++ b/drivers/media/video/s5p-fimc/fimc-core.c
@@ -1593,12 +1593,6 @@ static int fimc_probe(struct platform_device *pdev)
 		goto err_clk;
 	}
 
-	fimc->work_queue = create_workqueue(dev_name(&fimc->pdev->dev));
-	if (!fimc->work_queue) {
-		ret = -ENOMEM;
-		goto err_irq;
-	}
-
 	ret = fimc_register_m2m_device(fimc);
 	if (ret)
 		goto err_irq;
