From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 02 Aug 2010 08:31:12 +0000
Subject: [PATCH 1/9 v2] staging: dt3155: check put_user() return value
Message-Id: <1280737873-5992-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, H Hartley Sweeten <hsweeten@visionengravers.com>, Simon Horman <horms@verge.net.au>, Joe Eloff <kagen101@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

put_user() return code was not checked for errors. To simplify the code
fill local struct dt3155_read with data and copy it with single
copy_to_user() call.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/dt3155/dt3155_drv.c |   17 ++++++++---------
 1 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/dt3155/dt3155_drv.c b/drivers/staging/dt3155/dt3155_drv.c
index 7316996..4013f09 100644
--- a/drivers/staging/dt3155/dt3155_drv.c
+++ b/drivers/staging/dt3155/dt3155_drv.c
@@ -745,10 +745,11 @@ static ssize_t dt3155_read(struct file *filep, char __user *buf,
   struct dt3155_status *dts = &dt3155_status[minor];
   struct dt3155_fbuffer *fb = &dts->fbuffer;
   struct frame_info	*frame_info;
+  struct dt3155_read dt_read;
 
   /* TODO: this should check the error flag and */
   /*   return an error on hardware failures */
-  if (count != sizeof(struct dt3155_read))
+  if (count != sizeof(dt_read))
     {
       printk(KERN_INFO "DT3155 ERROR (NJC): count is not right\n");
       return -EINVAL;
@@ -797,17 +798,15 @@ static ssize_t dt3155_read(struct file *filep, char __user *buf,
 
   /* make this an offset */
   offset = frame_info->addr - dts->mem_addr;
+  dt_read.offset = offset;
+  dt_read.frame_seq = fb->frame_count;
+  dt_read.state = dts->state;
+  memcpy(&dt_read.frame_info, frame_info, sizeof(frame_info));
 
-  put_user(offset, (unsigned int __user *)buf);
-  buf += sizeof(u32);
-  put_user(fb->frame_count, (unsigned int __user *)buf);
-  buf += sizeof(u32);
-  put_user(dts->state, (unsigned int __user *)buf);
-  buf += sizeof(u32);
-  if (copy_to_user(buf, frame_info, sizeof(*frame_info)))
+  if (copy_to_user(buf, &dt_read, sizeof(dt_read)))
       return -EFAULT;
 
-  return sizeof(struct dt3155_read);
+  return sizeof(dt_read);
 }
 
 static unsigned int dt3155_poll (struct file * filp, poll_table *wait)
-- 
1.7.0.4

