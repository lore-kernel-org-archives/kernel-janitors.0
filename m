From: Alexander Nyberg <alexn@telia.com>
Date: Tue, 15 Jun 2004 23:44:46 +0000
Subject: [Kernel-janitors] Sparse checks #6
Message-Id: <1087343078.676.109.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60148008326220537=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60148008326220537==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sparse checks for drivers/

Signed-off-by: Alexander Nyberg <alexn@telia.com>

===== drivers/char/watchdog/alim1535_wdt.c 1.6 vs edited =====
--- 1.6/drivers/char/watchdog/alim1535_wdt.c    2004-05-28 22:17:35 +02:00
+++ edited/drivers/char/watchdog/alim1535_wdt.c 2004-06-16 01:09:37 +02:00
@@ -138,7 +138,7 @@
  *     the next close to turn off the watchdog.
  */

-static ssize_t ali_write(struct file *file, const char *data,
+static ssize_t ali_write(struct file *file, const char __user *data,
                              size_t len, loff_t * ppos)
 {
        /*  Can't seek (pwrite) on this device  */
@@ -194,12 +194,12 @@

        switch (cmd) {
                case WDIOC_GETSUPPORT:
-                       return copy_to_user((struct watchdog_info *) arg, &ident,
+                       return copy_to_user((struct watchdog_info __user *) arg, &ident,                                sizeof (ident)) ? -EFAULT : 0;

                case WDIOC_GETSTATUS:
                case WDIOC_GETBOOTSTATUS:
-                       return put_user(0, (int *) arg);
+                       return put_user(0, (int __user *) arg);

                case WDIOC_KEEPALIVE:
                        ali_keepalive();
@@ -209,7 +209,7 @@
                {
                        int new_options, retval = -EINVAL;

-                       if (get_user (new_options, (int *) arg))
+                       if (get_user (new_options, (int __user *) arg))
                                return -EFAULT;

                        if (new_options & WDIOS_DISABLECARD) {
@@ -229,7 +229,7 @@
                {
                        int new_timeout;

-                       if (get_user(new_timeout, (int *) arg))
+                       if (get_user(new_timeout, (int __user *) arg))
                                return -EFAULT;

                        if (ali_settimer(new_timeout))
@@ -240,7 +240,7 @@
                }

                case WDIOC_GETTIMEOUT:
-                       return put_user(timeout, (int *)arg);
+                       return put_user(timeout, (int __user *)arg);

                default:
                        return -ENOIOCTLCMD;
===== drivers/char/watchdog/alim7101_wdt.c 1.14 vs edited =====
--- 1.14/drivers/char/watchdog/alim7101_wdt.c   2004-05-28 22:17:36 +02:00
+++ edited/drivers/char/watchdog/alim7101_wdt.c 2004-06-16 01:10:58 +02:00
@@ -148,7 +148,7 @@
  * /dev/watchdog handling
  */

-static ssize_t fop_write(struct file * file, const char * buf, size_t count, loff_t * ppos)
+static ssize_t fop_write(struct file * file, const char __user * buf, size_t count, loff_t * ppos)
 {
        /* We can't seek */
        if(ppos != &file->f_pos)
@@ -213,10 +213,10 @@
        switch(cmd)
        {
                case WDIOC_GETSUPPORT:
-                       return copy_to_user((struct watchdog_info *)arg, &ident, sizeof(ident))?-EFAULT:0;
+                       return copy_to_user((struct watchdog_info __user *)arg, &ident, sizeof(ident))?-EFAULT:0;
                case WDIOC_GETSTATUS:
                case WDIOC_GETBOOTSTATUS:
-                       return put_user(0, (int *)arg);
+                       return put_user(0, (int __user *)arg);
                case WDIOC_KEEPALIVE:
                        wdt_keepalive();
                        return 0;
@@ -224,7 +224,7 @@
                {
                        int new_options, retval = -EINVAL;

-                       if(get_user(new_options, (int *)arg))
+                       if(get_user(new_options, (int __user *)arg))
                                return -EFAULT;

                        if(new_options & WDIOS_DISABLECARD) {
@@ -243,7 +243,7 @@
                {
                        int new_timeout;

-                       if(get_user(new_timeout, (int *)arg))
+                       if(get_user(new_timeout, (int __user *)arg))
                                return -EFAULT;

                        if(new_timeout < 1 || new_timeout > 3600) /* arbitrary upper limit */
@@ -254,7 +254,7 @@
                        /* Fall through */
                }
                case WDIOC_GETTIMEOUT:
-                       return put_user(timeout, (int *)arg);
+                       return put_user(timeout, (int __user *)arg);
                default:
                        return -ENOIOCTLCMD;
        }
===== drivers/char/watchdog/cpu5wdt.c 1.9 vs edited =====
--- 1.9/drivers/char/watchdog/cpu5wdt.c 2004-04-12 19:54:27 +02:00
+++ edited/drivers/char/watchdog/cpu5wdt.c      2004-06-16 01:12:11 +02:00
@@ -159,15 +159,15 @@
                case WDIOC_GETSTATUS:
                        value = inb(port + CPU5WDT_STATUS_REG);
                        value = (value >> 2) & 1;
-                       if ( copy_to_user((int *)arg, (int *)&value, sizeof(int)) )
+                       if ( copy_to_user((int __user *)arg, (int *)&value, sizeof(int)) )
                                return -EFAULT;
                        break;
                case WDIOC_GETSUPPORT:
-                       if ( copy_to_user((struct watchdog_info *)arg, &ident, sizeof(ident)) )
+                       if ( copy_to_user((struct watchdog_info __user *)arg, &ident, sizeof(ident)) )
                                return -EFAULT;
                        break;
                case WDIOC_SETOPTIONS:
-                       if ( copy_from_user(&value, (int *)arg, sizeof(int)) )
+                       if ( copy_from_user(&value, (int __user *)arg, sizeof(int)) )
                                return -EFAULT;
                        switch(value) {
                                case WDIOS_ENABLECARD:
@@ -185,7 +185,7 @@
        return 0;
 }

-static ssize_t cpu5wdt_write(struct file *file, const char *buf, size_t count, loff_t *ppos)
+static ssize_t cpu5wdt_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 {
        if ( !count )
                return -EIO;
===== drivers/char/watchdog/eurotechwdt.c 1.18 vs edited =====
--- 1.18/drivers/char/watchdog/eurotechwdt.c    2004-03-12 10:33:00 +01:00
+++ edited/drivers/char/watchdog/eurotechwdt.c  2004-06-16 01:13:23 +02:00
@@ -196,7 +196,7 @@
  * write of data will do, as we we don't define content meaning.
  */

-static ssize_t eurwdt_write(struct file *file, const char *buf, size_t count,
+static ssize_t eurwdt_write(struct file *file, const char __user *buf, size_t count,
 loff_t *ppos)
 {
        /*  Can't seek (pwrite) on this device  */
@@ -251,19 +251,19 @@
                return -ENOIOCTLCMD;

        case WDIOC_GETSUPPORT:
-               return copy_to_user((struct watchdog_info *)arg, &ident,
+               return copy_to_user((struct watchdog_info __user *)arg, &ident,
                        sizeof(ident)) ? -EFAULT : 0;

        case WDIOC_GETSTATUS:
        case WDIOC_GETBOOTSTATUS:
-               return put_user(0, (int *) arg);
+               return put_user(0, (int __user *) arg);

        case WDIOC_KEEPALIVE:
                eurwdt_ping();
                return 0;

        case WDIOC_SETTIMEOUT:
-               if (copy_from_user(&time, (int *) arg, sizeof(int)))
+               if (copy_from_user(&time, (int __user *) arg, sizeof(int)))
                        return -EFAULT;

                /* Sanity check */
@@ -275,10 +275,10 @@
                /* Fall */

        case WDIOC_GETTIMEOUT:
-               return put_user(eurwdt_timeout, (int *)arg);
+               return put_user(eurwdt_timeout, (int __user *)arg);

        case WDIOC_SETOPTIONS:
-               if (get_user(options, (int *)arg))
+               if (get_user(options, (int __user *)arg))
                        return -EFAULT;
                if (options & WDIOS_DISABLECARD) {
                        eurwdt_disable_timer();



--===============60148008326220537==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60148008326220537==--
