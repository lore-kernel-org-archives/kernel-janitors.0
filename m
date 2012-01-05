From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Jan 2012 06:24:00 +0000
Subject: [patch] [media] saa7134: use correct array offset
Message-Id: <20120105062400.GB25744@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that i can be one passed the end of the array if we
don't hit the break statement.  We should be using the "audio" here like
we do in the other places.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Compile tested only.  Please review carefully.

diff --git a/drivers/media/video/saa7134/saa7134-tvaudio.c b/drivers/media/video/saa7134/saa7134-tvaudio.c
index ec1df6f..b7a99be 100644
--- a/drivers/media/video/saa7134/saa7134-tvaudio.c
+++ b/drivers/media/video/saa7134/saa7134-tvaudio.c
@@ -605,7 +605,7 @@ static int tvaudio_thread(void *data)
 			if (kthread_should_stop())
 				break;
 			if (UNSET = dev->thread.mode) {
-				rx = tvaudio_getstereo(dev,&tvaudio[i]);
+				rx = tvaudio_getstereo(dev, &tvaudio[audio]);
 				mode = saa7134_tvaudio_rx2mode(rx);
 			} else {
 				mode = dev->thread.mode;
