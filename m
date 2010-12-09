From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:52:39 +0000
Subject: [PATCH] usb: gadget: f_fs: Remove redundant unlikely()
Message-Id: <1291906359-775-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/usb/gadget/f_fs.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/f_fs.c b/drivers/usb/gadget/f_fs.c
index a21349c..1499f9e 100644
--- a/drivers/usb/gadget/f_fs.c
+++ b/drivers/usb/gadget/f_fs.c
@@ -426,7 +426,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 		}
 
 		data = ffs_prepare_buffer(buf, len);
-		if (unlikely(IS_ERR(data))) {
+		if (IS_ERR(data)) {
 			ret = PTR_ERR(data);
 			break;
 		}
@@ -499,7 +499,7 @@ static ssize_t ffs_ep0_write(struct file *file, const char __user *buf,
 		spin_unlock_irq(&ffs->ev.waitq.lock);
 
 		data = ffs_prepare_buffer(buf, len);
-		if (unlikely(IS_ERR(data))) {
+		if (IS_ERR(data)) {
 			ret = PTR_ERR(data);
 			break;
 		}
-- 
1.7.0.4

