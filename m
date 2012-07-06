From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Jul 2012 08:21:49 +0000
Subject: [patch 2/2] Staging: vme: silence a Sparse warning
Message-Id: <20120706082149.GB12470@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sparse complains that "arg" is not a __user pointer.  The "argp" and
"arg" variables are equivalent but argp is declared as a __user pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vme/devices/vme_user.c b/drivers/staging/vme/devices/vme_user.c
index be198c0..4363ed5 100644
--- a/drivers/staging/vme/devices/vme_user.c
+++ b/drivers/staging/vme/devices/vme_user.c
@@ -471,7 +471,7 @@ static int vme_user_ioctl(struct inode *inode, struct file *file,
 	case CONTROL_MINOR:
 		switch (cmd) {
 		case VME_IRQ_GEN:
-			copied = copy_from_user(&irq_req, (char *)arg,
+			copied = copy_from_user(&irq_req, argp,
 						sizeof(struct vme_irq_id));
 			if (copied != 0) {
 				printk(KERN_WARNING "Partial copy from userspace\n");
