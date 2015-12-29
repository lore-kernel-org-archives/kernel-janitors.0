From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 10:18:46 +0000
Subject: [PATCH] [media] hdpvr: Refactoring for hdpvr_read()
Message-Id: <56825E06.6040708@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 11:02:43 +0100

Let us return directly if the element "status" of the variable "buf"
indicates "BUFSTAT_READY".
A check repetition can be excluded for the variable "ret" at the end then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/usb/hdpvr/hdpvr-video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 7dee22d..ba7f022 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -462,10 +462,8 @@ static ssize_t hdpvr_read(struct file *file, char __user *buffer, size_t count,
 			}
 
 			if (wait_event_interruptible(dev->wait_data,
-					      buf->status = BUFSTAT_READY)) {
-				ret = -ERESTARTSYS;
-				goto err;
-			}
+					      buf->status = BUFSTAT_READY))
+				return -ERESTARTSYS;
 		}
 
 		if (buf->status != BUFSTAT_READY)
-- 
2.6.3

