From: Nikanth Karthikesan <knikanth@suse.de>
Date: Thu, 10 Jan 2008 05:41:06 +0000
Subject: Re: [PATCH] Change paride driver to use unlocked_ioctl instead of
Message-Id: <1199942946.4474.18.camel@nikanth-laptop.blr.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4785B7BC.5040106@suse.de> <4785C7D8.2020808@suse.de>
	 <20080109123311.GP16309@parisc-linux.org>
	 <Pine.LNX.4.64.0801091425100.25041@twin.jikos.cz>
	 <47854BF3.BANGALORE.BLR.100.174746A.1.EB89.1@1:7.BANGALORE.BLR.100.0.1.0.1@16>
In-Reply-To: <47854BF3.BANGALORE.BLR.100.174746A.1.EB89.1@1:7.BANGALORE.BLR.100.0.1.0.1@16>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Jiri Kosina <jikos@jikos.cz>, Matthew Wilcox <matthew@wil.cx>, grant@torque.net, tim@cyberelk.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2008-01-09 at 16:56 +0000, Alan Cox wrote:
> On Wed, 9 Jan 2008 14:26:26 +0100 (CET)
> Jiri Kosina <jikos@jikos.cz> wrote:
> 
> > On Wed, 9 Jan 2008, Matthew Wilcox wrote:
> > 
> > > >  	default:
> > > >  		printk("%s: Unimplemented ioctl 0x%x\n", tape->name, cmd);
> > > > +		unlock_kernel();
> > > >  		return -EINVAL;
> > > Surely a bug ... shouldn't this return -ENOTTY?
> 
> Agreed - ENOTTY. The printk is wrong as well, but this is just getting
> shown up by the other changes.
> 
> Does anyone even use parallel IDE devices any more ?

Resending the patch. Also made the locks a little tighter, but I am not
sure whether the locks are required.

The ioctl handler is called with the BKL held. Registering
unlocked_ioctl handler instead of registering ioctl handler.
Also changed the return value to -ENOTTY for invalid ioctls.

Signed-off-by: Nikanth Karthikesan <knikanth@suse.de>

---


diff --git a/drivers/block/paride/pt.c b/drivers/block/paride/pt.c
index b91accf..b7215fa 100644
--- a/drivers/block/paride/pt.c
+++ b/drivers/block/paride/pt.c
@@ -146,6 +146,7 @@ static int (*drives[4])[6] = {&drive0, &drive1, &drive2, &drive3};
 #include <linux/mtio.h>
 #include <linux/device.h>
 #include <linux/sched.h>	/* current, TASK_*, schedule_timeout() */
+#include <linux/smp_lock.h>
 
 #include <asm/uaccess.h>
 
@@ -189,8 +190,8 @@ module_param_array(drive3, int, NULL, 0);
 #define ATAPI_LOG_SENSE		0x4d
 
 static int pt_open(struct inode *inode, struct file *file);
-static int pt_ioctl(struct inode *inode, struct file *file,
-		    unsigned int cmd, unsigned long arg);
+static long pt_ioctl(struct file *file, unsigned int cmd,
+			unsigned long arg);
 static int pt_release(struct inode *inode, struct file *file);
 static ssize_t pt_read(struct file *filp, char __user *buf,
 		       size_t count, loff_t * ppos);
@@ -236,7 +237,7 @@ static const struct file_operations pt_fops = {
 	.owner = THIS_MODULE,
 	.read = pt_read,
 	.write = pt_write,
-	.ioctl = pt_ioctl,
+	.unlocked_ioctl = pt_ioctl,
 	.open = pt_open,
 	.release = pt_release,
 };
@@ -685,8 +686,8 @@ out:
 	return err;
 }
 
-static int pt_ioctl(struct inode *inode, struct file *file,
-	 unsigned int cmd, unsigned long arg)
+static long pt_ioctl(struct file *file, unsigned int cmd,
+	unsigned long arg)
 {
 	struct pt_unit *tape = file->private_data;
 	struct mtop __user *p = (void __user *)arg;
@@ -700,11 +701,15 @@ static int pt_ioctl(struct inode *inode, struct file *file,
 		switch (mtop.mt_op) {
 
 		case MTREW:
+			lock_kernel();
 			pt_rewind(tape);
+			unlock_kernel();
 			return 0;
 
 		case MTWEOF:
+			lock_kernel();
 			pt_write_fm(tape);
+			unlock_kernel();
 			return 0;
 
 		default:
@@ -714,8 +719,8 @@ static int pt_ioctl(struct inode *inode, struct file *file,
 		}
 
 	default:
-		printk("%s: Unimplemented ioctl 0x%x\n", tape->name, cmd);
-		return -EINVAL;
+		printk("%s: Invalid ioctl 0x%x\n", tape->name, cmd);
+		return -ENOTTY;
 
 	}
 }


