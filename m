From: Alexander Nyberg <alexn@telia.com>
Date: Tue, 15 Jun 2004 23:45:56 +0000
Subject: [Kernel-janitors] Sparse checks #10
Message-Id: <1087343108.676.117.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28075013436636986=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28075013436636986==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sparse checks for drivers/

Signed-off-by: Alexander Nyberg <alexn@telia.com>

===== drivers/char/isicom.c 1.33 vs edited =====
--- 1.33/drivers/char/isicom.c  2004-04-12 19:55:26 +02:00
+++ edited/drivers/char/isicom.c        2004-06-16 00:04:54 +02:00
@@ -134,7 +134,7 @@
        bin_frame frame;
        /* exec_record exec_rec; */

-       if(get_user(card, (int *)arg))
+       if(get_user(card, (int __user *)arg))
                return -EFAULT;

        if(card < 0 || card >= BOARD_COUNT)
@@ -208,13 +208,13 @@
                                 return -EIO;
                        }
                        printk("-Done\n");
-                       return put_user(signature,(unsigned int*)arg);
+                       return put_user(signature,(unsigned int __user *)arg);

        case    MIOCTL_LOAD_FIRMWARE:
                        if (!capable(CAP_SYS_ADMIN))
                                return -EPERM;

-                       if(copy_from_user(&frame, (void *) arg, sizeof(bin_frame)))
+                       if(copy_from_user(&frame, (void __user *) arg, sizeof(bin_frame)))
                                return -EFAULT;

                        if (WaitTillCardIsFree(base))
@@ -257,7 +257,7 @@
                        if (!capable(CAP_SYS_ADMIN))
                                return -EPERM;

-                       if(copy_from_user(&frame, (void *) arg, sizeof(bin_header)))
+                       if(copy_from_user(&frame, (void __user *) arg, sizeof(bin_header)))
                                return -EFAULT;

                        if (WaitTillCardIsFree(base))
@@ -296,7 +296,7 @@
                                return -EIO;
                        }

-                       if(copy_to_user((void *) arg, &frame, sizeof(bin_frame)))
+                       if(copy_to_user((void __user *) arg, &frame, sizeof(bin_frame)))                                return -EFAULT;
                        return 0;

===== drivers/char/istallion.c 1.39 vs edited =====
--- 1.39/drivers/char/istallion.c       2004-04-15 17:39:24 +02:00
+++ edited/drivers/char/istallion.c     2004-06-16 00:09:35 +02:00
@@ -680,8 +680,8 @@

 static int     stli_brdinit(stlibrd_t *brdp);
 static int     stli_startbrd(stlibrd_t *brdp);
-static ssize_t stli_memread(struct file *fp, char *buf, size_t count, loff_t *offp);
-static ssize_t stli_memwrite(struct file *fp, const char *buf, size_t count, loff_t *offp);
+static ssize_t stli_memread(struct file *fp, char __user *buf, size_t count, loff_t *offp);
+static ssize_t stli_memwrite(struct file *fp, const char __user *buf, size_t count, loff_t *offp);
 static int     stli_memioctl(struct inode *ip, struct file *fp, unsigned int cmd, unsigned long arg);
 static void    stli_brdpoll(stlibrd_t *brdp, volatile cdkhdr_t *hdrp);
 static void    stli_poll(unsigned long arg);
@@ -4815,7 +4815,7 @@
  *     the slave image (and debugging :-)
  */

-static ssize_t stli_memread(struct file *fp, char *buf, size_t count, loff_t *offp)
+static ssize_t stli_memread(struct file *fp, char __user *buf, size_t count, loff_t *offp)
 {
        unsigned long   flags;
        void            *memptr;
@@ -4869,7 +4869,7 @@
  *     the slave image (and debugging :-)
  */

-static ssize_t stli_memwrite(struct file *fp, const char *buf, size_t count, loff_t *offp)
+static ssize_t stli_memwrite(struct file *fp, const char __user *buf, size_t count, loff_t *offp)
 {
        unsigned long   flags;
        void            *memptr;
@@ -4923,7 +4923,7 @@
  *     Return the board stats structure to user app.
  */

-static int stli_getbrdstats(combrd_t *bp)
+static int stli_getbrdstats(combrd_t __user *bp)
 {
        stlibrd_t       *brdp;
        int             i;
@@ -5062,7 +5062,7 @@
  *     what port to get stats for (used through board control device).
  */

-static int stli_getportstats(stliport_t *portp, comstats_t *cp)
+static int stli_getportstats(stliport_t *portp, comstats_t __user *cp)
 {
        stlibrd_t       *brdp;
        int             rc;
@@ -5093,7 +5093,7 @@
  *     Clear the port stats structure. We also return it zeroed out...
  */

-static int stli_clrportstats(stliport_t *portp, comstats_t *cp)
+static int stli_clrportstats(stliport_t *portp, comstats_t __user *cp)
 {
        stlibrd_t       *brdp;
        int             rc;
@@ -5136,13 +5136,13 @@
 {
        stliport_t      *portp;

-       if (copy_from_user(&stli_dummyport, (void *)arg, sizeof(stliport_t)))
+       if (copy_from_user(&stli_dummyport, (void __user *)arg, sizeof(stliport_t)))
                return -EFAULT;
        portp = stli_getport(stli_dummyport.brdnr, stli_dummyport.panelnr,
                 stli_dummyport.portnr);
        if (portp == (stliport_t *) NULL)
                return(-ENODEV);
-       if (copy_to_user((void *) arg, portp, sizeof(stliport_t)))
+       if (copy_to_user((void __user *) arg, portp, sizeof(stliport_t)))
                return -EFAULT;
        return(0);
 }
@@ -5157,14 +5157,14 @@
 {
        stlibrd_t       *brdp;

-       if (copy_from_user(&stli_dummybrd, (void *)arg, sizeof(stlibrd_t)))
+       if (copy_from_user(&stli_dummybrd, (void __user *)arg, sizeof(stlibrd_t)))
                return -EFAULT;
        if ((stli_dummybrd.brdnr < 0) || (stli_dummybrd.brdnr >= STL_MAXBRDS))
                return(-ENODEV);
        brdp = stli_brds[stli_dummybrd.brdnr];
        if (brdp == (stlibrd_t *) NULL)
                return(-ENODEV);
-       if (copy_to_user((void *) arg, brdp, sizeof(stlibrd_t)))
+       if (copy_to_user((void __user *) arg, brdp, sizeof(stlibrd_t)))
                return -EFAULT;
        return(0);
 }
@@ -5195,15 +5195,15 @@

        switch (cmd) {
        case COM_GETPORTSTATS:
-               rc = stli_getportstats((stliport_t *)NULL, (comstats_t *)arg);
+               rc = stli_getportstats((stliport_t *)NULL, (comstats_t __user *)arg);
                done++;
                break;
        case COM_CLRPORTSTATS:
-               rc = stli_clrportstats((stliport_t *)NULL, (comstats_t *)arg);
+               rc = stli_clrportstats((stliport_t *)NULL, (comstats_t __user *)arg);
                done++;
                break;
        case COM_GETBRDSTATS:
-               rc = stli_getbrdstats((combrd_t *) arg);
+               rc = stli_getbrdstats((combrd_t __user *) arg);
                done++;
                break;
        case COM_READPORT:
===== drivers/char/ite_gpio.c 1.7 vs edited =====
--- 1.7/drivers/char/ite_gpio.c 2003-10-13 20:32:28 +02:00
+++ edited/drivers/char/ite_gpio.c      2004-06-16 00:11:12 +02:00
@@ -258,7 +258,7 @@

        static struct ite_gpio_ioctl_data ioctl_data;

-       if (copy_from_user(&ioctl_data, (struct ite_gpio_ioctl_data *)arg,
+       if (copy_from_user(&ioctl_data, (struct ite_gpio_ioctl_data __user *)arg,
                        sizeof(ioctl_data)))
                return -EFAULT;
        if ((ioctl_data.device < ITE_GPIO_PORTA) ||
@@ -271,7 +271,7 @@
                                           &ioctl_data.data))
                                return -EFAULT;

-                       if (copy_to_user((struct ite_gpio_ioctl_data *)arg,
+                       if (copy_to_user((struct ite_gpio_ioctl_data __user *)arg,
                                         &ioctl_data, sizeof(ioctl_data)))
                                return -EFAULT;
                        break;
@@ -290,7 +290,7 @@
                        if (ite_gpio_in_status(ioctl_data.device, ioctl_data.mask,
                                        &ioctl_data.data))
                                return -EFAULT;
-                       if (copy_to_user((struct ite_gpio_ioctl_data *)arg,
+                       if (copy_to_user((struct ite_gpio_ioctl_data __user *)arg,
                                        &ioctl_data, sizeof(ioctl_data)))
                                return -EFAULT;
                        break;



--===============28075013436636986==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28075013436636986==--
