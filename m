From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Sep 2017 12:07:50 +0000
Subject: [PATCH] [media] imon: make two const arrays static, reduces object code size
Message-Id: <20170905120750.16627-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, Hans Verkuil <hans.verkuil@cisco.com>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const arrays vfd_packet6 and fp_packet on the
stack, instead make them static.  Makes the object code smaller
by over 600 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  43794	  17920	   1024	  62738	   f512	drivers/media/rc/imon.o

After:
   text	   data	    bss	    dec	    hex	filename
  42994	  18080	   1024	  62098	   f292	drivers/media/rc/imon.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/rc/imon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 7b3f31cc63d2..c50875a8c5b6 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -943,7 +943,7 @@ static ssize_t vfd_write(struct file *file, const char __user *buf,
 	int seq;
 	int retval = 0;
 	struct imon_context *ictx;
-	const unsigned char vfd_packet6[] = {
+	static const unsigned char vfd_packet6[] = {
 		0x01, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF };
 
 	ictx = file->private_data;
@@ -2047,8 +2047,8 @@ static struct rc_dev *imon_init_rdev(struct imon_context *ictx)
 {
 	struct rc_dev *rdev;
 	int ret;
-	const unsigned char fp_packet[] = { 0x40, 0x00, 0x00, 0x00,
-					    0x00, 0x00, 0x00, 0x88 };
+	static const unsigned char fp_packet[] = {
+		0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88 };
 
 	rdev = rc_allocate_device(ictx->dev_descr->flags & IMON_IR_RAW ?
 				  RC_DRIVER_IR_RAW : RC_DRIVER_SCANCODE);
-- 
2.14.1

