From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 26 Nov 2010 17:06:41 +0000
Subject: [PATCH] media: rc: lirc_dev: check kobject_set_name() result
Message-Id: <1290791203-21448-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

kobject_set_name() may fail with -ENOMEM, check for it.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/media/rc/lirc_dev.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/media/rc/lirc_dev.c b/drivers/media/rc/lirc_dev.c
index 8418b14..0a2d267 100644
--- a/drivers/media/rc/lirc_dev.c
+++ b/drivers/media/rc/lirc_dev.c
@@ -178,7 +178,9 @@ static int lirc_cdev_add(struct irctl *ir)
 		cdev_init(cdev, &lirc_dev_fops);
 		cdev->owner = THIS_MODULE;
 	}
-	kobject_set_name(&cdev->kobj, "lirc%d", d->minor);
+	retval = kobject_set_name(&cdev->kobj, "lirc%d", d->minor);
+	if (retval)
+		return retval;
 
 	retval = cdev_add(cdev, MKDEV(MAJOR(lirc_base_dev), d->minor), 1);
 	if (retval)
-- 
1.7.0.4

