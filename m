From: Alexander Nyberg <alexn@telia.com>
Date: Tue, 15 Jun 2004 23:44:35 +0000
Subject: [Kernel-janitors] Sparse checks #5
Message-Id: <1087343075.676.107.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54069719051862442=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54069719051862442==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sparse checks for drivers/

Signed-off-by: Alexander Nyberg <alexn@telia.com>

===== drivers/char/watchdog/i8xx_tco.c 1.26 vs edited =====
--- 1.26/drivers/char/watchdog/i8xx_tco.c       2004-02-11 21:13:19 +01:00
+++ edited/drivers/char/watchdog/i8xx_tco.c     2004-06-16 01:14:30 +02:00
@@ -212,7 +212,7 @@
        return 0;
 }

-static ssize_t i8xx_tco_write (struct file *file, const char *data,
+static ssize_t i8xx_tco_write (struct file *file, const char __user *data,
                              size_t len, loff_t * ppos)
 {
        /*  Can't seek (pwrite) on this device  */
@@ -259,12 +259,12 @@

        switch (cmd) {
                case WDIOC_GETSUPPORT:
-                       return copy_to_user((struct watchdog_info *) arg, &ident,
+                       return copy_to_user((struct watchdog_info __user *) arg, &ident,                                sizeof (ident)) ? -EFAULT : 0;

                case WDIOC_GETSTATUS:
                case WDIOC_GETBOOTSTATUS:
-                       return put_user (0, (int *) arg);
+                       return put_user (0, (int __user *) arg);

                case WDIOC_KEEPALIVE:
                        tco_timer_keepalive ();
@@ -272,7 +272,7 @@

                case WDIOC_SETOPTIONS:
                {
-                       if (get_user (new_options, (int *) arg))
+                       if (get_user (new_options, (int __user *) arg))
                                return -EFAULT;

                        if (new_options & WDIOS_DISABLECARD) {
@@ -291,7 +291,7 @@

                case WDIOC_SETTIMEOUT:
                {
-                       if (get_user(new_heartbeat, (int *) arg))
+                       if (get_user(new_heartbeat, (int __user *) arg))
                                return -EFAULT;

                        if (tco_timer_set_heartbeat(new_heartbeat))
@@ -302,7 +302,7 @@
                }

                case WDIOC_GETTIMEOUT:
-                       return put_user(heartbeat, (int *)arg);
+                       return put_user(heartbeat, (int __user *)arg);

                default:
                        return -ENOIOCTLCMD;
===== drivers/char/watchdog/ib700wdt.c 1.29 vs edited =====
--- 1.29/drivers/char/watchdog/ib700wdt.c       2004-05-15 08:11:55 +02:00
+++ edited/drivers/char/watchdog/ib700wdt.c     2004-06-16 01:15:39 +02:00
@@ -139,7 +139,7 @@
 }

 static ssize_t
-ibwdt_write(struct file *file, const char *buf, size_t count, loff_t *ppos)
+ibwdt_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 {
        /*  Can't seek (pwrite) on this device  */
        if (ppos != &file->f_pos)
@@ -179,19 +179,19 @@

        switch (cmd) {
        case WDIOC_GETSUPPORT:
-         if (copy_to_user((struct watchdog_info *)arg, &ident, sizeof(ident)))
+         if (copy_to_user((struct watchdog_info __user *)arg, &ident, sizeof(ident)))
            return -EFAULT;
          break;

        case WDIOC_GETSTATUS:
-         return put_user(0, (int *) arg);
+         return put_user(0, (int __user *) arg);

        case WDIOC_KEEPALIVE:
          ibwdt_ping();
          break;

        case WDIOC_SETTIMEOUT:
-         if (get_user(new_margin, (int *)arg))
+         if (get_user(new_margin, (int __user *)arg))
                  return -EFAULT;
          if ((new_margin < 0) || (new_margin > 30))
                  return -EINVAL;
@@ -203,7 +203,7 @@
          /* Fall */

        case WDIOC_GETTIMEOUT:
-         return put_user(wd_times[wd_margin], (int *)arg);
+         return put_user(wd_times[wd_margin], (int __user *)arg);
          break;

        default:
===== drivers/char/watchdog/indydog.c 1.12 vs edited =====
--- 1.12/drivers/char/watchdog/indydog.c        2004-02-11 21:00:54 +01:00
+++ edited/drivers/char/watchdog/indydog.c      2004-06-16 01:16:52 +02:00
@@ -106,7 +106,7 @@
        return 0;
 }

-static ssize_t indydog_write(struct file *file, const char *data, size_t len, loff_t *ppos)
+static ssize_t indydog_write(struct file *file, const char __user *data, size_t len, loff_t *ppos)
 {
        /*  Can't seek (pwrite) on this device  */
        if (ppos != &file->f_pos)
@@ -149,20 +149,20 @@
                default:
                        return -ENOIOCTLCMD;
                case WDIOC_GETSUPPORT:
-                       if(copy_to_user((struct watchdog_info *)arg, &ident, sizeof(ident)))
+                       if(copy_to_user((struct watchdog_info __user *)arg, &ident, sizeof(ident)))
                                return -EFAULT;
                        return 0;
                case WDIOC_GETSTATUS:
                case WDIOC_GETBOOTSTATUS:
-                       return put_user(0,(int *)arg);
+                       return put_user(0,(int __user *)arg);
                case WDIOC_KEEPALIVE:
                        indydog_ping();
                        return 0;
                case WDIOC_GETTIMEOUT:
-                       return put_user(WATCHDOG_TIMEOUT,(int *)arg);
+                       return put_user(WATCHDOG_TIMEOUT,(int __user *)arg);
                case WDIOC_SETOPTIONS:
                {
-                       if (get_user(options, (int *)arg))
+                       if (get_user(options, (int __user *)arg))
                                return -EFAULT;

                        if (options & WDIOS_DISABLECARD)
===== drivers/char/watchdog/ixp4xx_wdt.c 1.1 vs edited =====
--- 1.1/drivers/char/watchdog/ixp4xx_wdt.c      2004-05-15 08:11:55 +02:00
+++ edited/drivers/char/watchdog/ixp4xx_wdt.c   2004-06-16 01:18:27 +02:00
@@ -73,7 +73,7 @@
 }

 static ssize_t
-ixp4xx_wdt_write(struct file *file, const char *data, size_t len, loff_t *ppos)
+ixp4xx_wdt_write(struct file *file, const char __user *data, size_t len, loff_t *ppos)
 {
        /* Can't seek (pwrite) on this device  */
        if (ppos != &file->f_pos)
@@ -116,20 +116,20 @@

        switch (cmd) {
        case WDIOC_GETSUPPORT:
-               ret = copy_to_user((struct watchdog_info *)arg, &ident,
+               ret = copy_to_user((struct watchdog_info __user *)arg, &ident,
                                   sizeof(ident)) ? -EFAULT : 0;
                break;

        case WDIOC_GETSTATUS:
-               ret = put_user(0, (int *)arg);
+               ret = put_user(0, (int __user *)arg);
                break;

        case WDIOC_GETBOOTSTATUS:
-               ret = put_user(boot_status, (int *)arg);
+               ret = put_user(boot_status, (int __user *)arg);
                break;

        case WDIOC_SETTIMEOUT:
-               ret = get_user(time, (int *)arg);
+               ret = get_user(time, (int __user *)arg);
                if (ret)
                        break;

@@ -143,7 +143,7 @@
                /* Fall through */

        case WDIOC_GETTIMEOUT:
-               ret = put_user(heartbeat, (int *)arg);
+               ret = put_user(heartbeat, (int __user *)arg);
                break;

        case WDIOC_KEEPALIVE:
===== include/linux/ipmi.h 1.3 vs edited =====
--- 1.3/include/linux/ipmi.h    2004-04-12 19:54:18 +02:00
+++ edited/include/linux/ipmi.h 2004-06-15 23:59:31 +02:00
@@ -159,7 +159,7 @@
        unsigned char  netfn;
        unsigned char  cmd;
        unsigned short data_len;
-       unsigned char  *data;
+       unsigned char  __user *data;
 };

 /*
@@ -539,7 +539,7 @@
        int     recv_type; /* Is this a command, response or an
                              asyncronous event. */

-       unsigned char *addr;    /* Address the message was from is put
+       unsigned char __user *addr;/* Address the message was from is put
                                   here.  The caller must supply the
                                   memory. */
        unsigned int  addr_len; /* The size of the address buffer.



--===============54069719051862442==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54069719051862442==--
