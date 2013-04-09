From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Apr 2013 05:15:40 +0000
Subject: [patch] [media] dt3155v4l: unlock on error path
Message-Id: <20130409051540.GA1516@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: Bill Pemberton <wfp5p@virginia.edu>, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We should unlock here and do some cleanup before returning.

We can't actually hit this return path with the current code, so this
patch is a basically a cleanup and doesn't change how the code works.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/dt3155v4l/dt3155v4l.c b/drivers/staging/media/dt3155v4l/dt3155v4l.c
index 073b3b3..3da17bc 100644
--- a/drivers/staging/media/dt3155v4l/dt3155v4l.c
+++ b/drivers/staging/media/dt3155v4l/dt3155v4l.c
@@ -398,7 +398,7 @@ dt3155_open(struct file *filp)
 		pd->field_count = 0;
 		ret = vb2_queue_init(pd->q);
 		if (ret < 0)
-			return ret;
+			goto err_free_q;
 		INIT_LIST_HEAD(&pd->dmaq);
 		spin_lock_init(&pd->lock);
 		/* disable all irqs, clear all irq flags */
@@ -407,11 +407,11 @@ dt3155_open(struct file *filp)
 		ret = request_irq(pd->pdev->irq, dt3155_irq_handler_even,
 						IRQF_SHARED, DT3155_NAME, pd);
 		if (ret)
-			goto err_request_irq;
+			goto err_free_q;
 	}
 	pd->users++;
 	return 0; /* success */
-err_request_irq:
+err_free_q:
 	kfree(pd->q);
 	pd->q = NULL;
 err_alloc_queue:
