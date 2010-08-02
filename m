From: Vasiliy Kulikov <segooon@gmail.com>
Date: Mon, 02 Aug 2010 12:56:38 +0000
Subject: [PATCH 1/9 v3] staging: dt3155: check put_user() return value
Message-Id: <20100802125638.GA6412@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280737873-5992-1-git-send-email-segooon@gmail.com>
 <20100802124125.GG5814@verge.net.au>
In-Reply-To: <20100802124125.GG5814@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Horman <horms@verge.net.au>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, H Hartley Sweeten <hsweeten@visionengravers.com>, Joe Eloff <kagen101@gmail.com>, Randy Dunlap <randy.dunlap@oracle.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

put_user() returns code was not checked for errors. To simplify the code
fill local struct dt3155_read with data and copy it with single
copy_to_user() call.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/dt3155/dt3155_drv.c |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/dt3155/dt3155_drv.c b/drivers/staging/dt3155/dt3155_drv.c
index 7316996..6031837 100644
--- a/drivers/staging/dt3155/dt3155_drv.c
+++ b/drivers/staging/dt3155/dt3155_drv.c
@@ -745,6 +745,7 @@ static ssize_t dt3155_read(struct file *filep, char __user *buf,
   struct dt3155_status *dts = &dt3155_status[minor];
   struct dt3155_fbuffer *fb = &dts->fbuffer;
   struct frame_info	*frame_info;
+  struct dt3155_read dt_read;
 
   /* TODO: this should check the error flag and */
   /*   return an error on hardware failures */
@@ -797,14 +798,12 @@ static ssize_t dt3155_read(struct file *filep, char __user *buf,
 
   /* make this an offset */
   offset = frame_info->addr - dts->mem_addr;
+  dt_read.offset = offset;
+  dt_read.frame_seq = fb->frame_count;
+  dt_read.state = dts->state;
+  memcpy(&dt_read.frame_info, frame_info, sizeof(struct frame_info));
 
-  put_user(offset, (unsigned int __user *)buf);
-  buf += sizeof(u32);
-  put_user(fb->frame_count, (unsigned int __user *)buf);
-  buf += sizeof(u32);
-  put_user(dts->state, (unsigned int __user *)buf);
-  buf += sizeof(u32);
-  if (copy_to_user(buf, frame_info, sizeof(*frame_info)))
+  if (copy_to_user(buf, &dt_read, sizeof(struct dt3155_read)))
       return -EFAULT;
 
   return sizeof(struct dt3155_read);
-- 
1.7.0.4

