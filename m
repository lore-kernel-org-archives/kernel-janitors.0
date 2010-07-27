From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 27 Jul 2010 18:42:40 +0000
Subject: [PATCH] dvb: siano: free spinlock before schedule()
Message-Id: <1280256161-7971-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Douglas Schilling Landgraf <dougsland@redhat.com>, Jiri Kosina <jkosina@suse.cz>, Roel Kluin <roel.kluin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Calling schedule() holding spinlock with disables irqs is improper. As
spinlock protects list coredev->buffers, it can be unlocked untill wakeup.
This bug was introduced in a9349315f65cd6a16e8fab1f6cf0fd40f379c4db.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/media/dvb/siano/smscoreapi.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb/siano/smscoreapi.c b/drivers/media/dvb/siano/smscoreapi.c
index 7f2c94a..d93468c 100644
--- a/drivers/media/dvb/siano/smscoreapi.c
+++ b/drivers/media/dvb/siano/smscoreapi.c
@@ -1113,9 +1113,11 @@ struct smscore_buffer_t *smscore_getbuffer(struct smscore_device_t *coredev)
 	 */
 
 	prepare_to_wait(&coredev->buffer_mng_waitq, &wait, TASK_INTERRUPTIBLE);
-
-	if (list_empty(&coredev->buffers))
+	if (list_empty(&coredev->buffers)) {
+		spin_unlock_irqrestore(&coredev->bufferslock, flags);
 		schedule();
+		spin_lock_irqsave(&coredev->bufferslock, flags);
+	}
 
 	finish_wait(&coredev->buffer_mng_waitq, &wait);
 
-- 
1.7.0.4

