From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 13 Sep 2006 19:38:41 +0000
Subject: [KJ] [PATCH] drivers/usb/core: Remove unneeded void * casts
Message-Id: <20060913193841.GA31926@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch removes unneeded casts for the following (void *) pointers:
 - struct file: private
 - struct urb: context
 - struct usb_bus: hcpriv
 - return value of kmalloc()

The patch also contains some whitespace cleanup in the relevant areas.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

---

 drivers/usb/core/devices.c |    4 ++--
 drivers/usb/core/devio.c   |   12 ++++++------
 drivers/usb/core/hcd.c     |    2 +-
 drivers/usb/core/hub.c     |    4 ++--
 drivers/usb/core/message.c |    2 +-
 drivers/usb/core/urb.c     |    2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff -urpN -X dontdiff linux-2.6.18-rc5/drivers/usb/core/devices.c linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/devices.c
--- linux-2.6.18-rc5/drivers/usb/core/devices.c	2006-06-29 13:11:11.000000000 +0200
+++ linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/devices.c	2006-09-01 17:36:30.000000000 +0200
@@ -593,7 +593,7 @@ static ssize_t usb_device_read(struct fi
 /* Kernel lock for "lastev" protection */
 static unsigned int usb_device_poll(struct file *file, struct poll_table_struct *wait)
 {
-	struct usb_device_status *st = (struct usb_device_status *)file->private_data;
+	struct usb_device_status *st = file->private_data;
 	unsigned int mask = 0;
 
 	lock_kernel();
@@ -603,7 +603,7 @@ static unsigned int usb_device_poll(stru
 			unlock_kernel();
 			return POLLIN;
 		}
-		
+
 		/* we may have dropped BKL - need to check for having lost the race */
 		if (file->private_data) {
 			kfree(st);
diff -urpN -X dontdiff linux-2.6.18-rc5/drivers/usb/core/devio.c linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/devio.c
--- linux-2.6.18-rc5/drivers/usb/core/devio.c	2006-09-01 17:10:48.000000000 +0200
+++ linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/devio.c	2006-09-13 21:30:47.000000000 +0200
@@ -118,7 +118,7 @@ static loff_t usbdev_lseek(struct file *
 
 static ssize_t usbdev_read(struct file *file, char __user *buf, size_t nbytes, loff_t *ppos)
 {
-	struct dev_state *ps = (struct dev_state *)file->private_data;
+	struct dev_state *ps = file->private_data;
 	struct usb_device *dev = ps->dev;
 	ssize_t ret = 0;
 	unsigned len;
@@ -301,7 +301,7 @@ static void snoop_urb(struct urb *urb, v
 
 static void async_completed(struct urb *urb, struct pt_regs *regs)
 {
-        struct async *as = (struct async *)urb->context;
+        struct async *as = urb->context;
         struct dev_state *ps = as->ps;
 	struct siginfo sinfo;
 
@@ -586,7 +586,7 @@ static int usbdev_open(struct inode *ino
 
 static int usbdev_release(struct inode *inode, struct file *file)
 {
-	struct dev_state *ps = (struct dev_state *)file->private_data;
+	struct dev_state *ps = file->private_data;
 	struct usb_device *dev = ps->dev;
 	unsigned int ifnum;
 
@@ -1413,7 +1413,7 @@ static int proc_ioctl_compat(struct dev_
  */
 static int usbdev_ioctl(struct inode *inode, struct file *file, unsigned int cmd, unsigned long arg)
 {
-	struct dev_state *ps = (struct dev_state *)file->private_data;
+	struct dev_state *ps = file->private_data;
 	struct usb_device *dev = ps->dev;
 	void __user *p = (void __user *)arg;
 	int ret = -ENOTTY;
@@ -1556,8 +1556,8 @@ static int usbdev_ioctl(struct inode *in
 /* No kernel lock - fine */
 static unsigned int usbdev_poll(struct file *file, struct poll_table_struct *wait)
 {
-	struct dev_state *ps = (struct dev_state *)file->private_data;
-        unsigned int mask = 0;
+	struct dev_state *ps = file->private_data;
+	unsigned int mask = 0;
 
 	poll_wait(file, &ps->wait, wait);
 	if (file->f_mode & FMODE_WRITE && !list_empty(&ps->async_completed))
diff -urpN -X dontdiff linux-2.6.18-rc5/drivers/usb/core/hcd.c linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/hcd.c
--- linux-2.6.18-rc5/drivers/usb/core/hcd.c	2006-09-01 17:10:48.000000000 +0200
+++ linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/hcd.c	2006-09-13 21:27:26.000000000 +0200
@@ -1223,7 +1223,7 @@ done:
 /* called in any context */
 static int hcd_get_frame_number (struct usb_device *udev)
 {
-	struct usb_hcd	*hcd = (struct usb_hcd *)udev->bus->hcpriv;
+	struct usb_hcd	*hcd = udev->bus->hcpriv;
 	if (!HC_IS_RUNNING (hcd->state))
 		return -ESHUTDOWN;
 	return hcd->driver->get_frame_number (hcd);
diff -urpN -X dontdiff linux-2.6.18-rc5/drivers/usb/core/hub.c linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/hub.c
--- linux-2.6.18-rc5/drivers/usb/core/hub.c	2006-09-01 17:10:48.000000000 +0200
+++ linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/hub.c	2006-09-01 17:36:31.000000000 +0200
@@ -293,7 +293,7 @@ void usb_kick_khubd(struct usb_device *h
 /* completion function, fires on port status changes and various faults */
 static void hub_irq(struct urb *urb, struct pt_regs *regs)
 {
-	struct usb_hub *hub = (struct usb_hub *)urb->context;
+	struct usb_hub *hub = urb->context;
 	int status;
 	int i;
 	unsigned long bits;
@@ -311,7 +311,7 @@ static void hub_irq(struct urb *urb, str
 			goto resubmit;
 		hub->error = urb->status;
 		/* FALL THROUGH */
-	
+
 	/* let khubd handle things */
 	case 0:			/* we got data:  port status changed */
 		bits = 0;
diff -urpN -X dontdiff linux-2.6.18-rc5/drivers/usb/core/message.c linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/message.c
--- linux-2.6.18-rc5/drivers/usb/core/message.c	2006-09-01 17:10:48.000000000 +0200
+++ linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/message.c	2006-09-01 17:36:31.000000000 +0200
@@ -263,7 +263,7 @@ static void sg_clean (struct usb_sg_requ
 
 static void sg_complete (struct urb *urb, struct pt_regs *regs)
 {
-	struct usb_sg_request	*io = (struct usb_sg_request *) urb->context;
+	struct usb_sg_request	*io = urb->context;
 
 	spin_lock (&io->lock);
 
diff -urpN -X dontdiff linux-2.6.18-rc5/drivers/usb/core/urb.c linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/urb.c
--- linux-2.6.18-rc5/drivers/usb/core/urb.c	2006-09-01 17:10:48.000000000 +0200
+++ linux-2.6.18-rc5~unneeded_casts/drivers/usb/core/urb.c	2006-09-01 17:36:31.000000000 +0200
@@ -57,7 +57,7 @@ struct urb *usb_alloc_urb(int iso_packet
 {
 	struct urb *urb;
 
-	urb = (struct urb *)kmalloc(sizeof(struct urb) + 
+	urb = kmalloc(sizeof(struct urb) +
 		iso_packets * sizeof(struct usb_iso_packet_descriptor),
 		mem_flags);
 	if (!urb) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
