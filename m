From: Alexander Nyberg <alexn@telia.com>
Date: Tue, 15 Jun 2004 23:44:51 +0000
Subject: [Kernel-janitors] Sparse checks #7
Message-Id: <1087343086.676.111.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97465973433625108=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97465973433625108==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sparse checks for drivers/

Signed-off-by: Alexander Nyberg <alexn@telia.com>

===== drivers/char/ipmi/ipmi_watchdog.c 1.6 vs edited =====
--- 1.6/drivers/char/ipmi/ipmi_watchdog.c       2004-04-12 19:54:18 +02:00
+++ edited/drivers/char/ipmi/ipmi_watchdog.c    2004-06-16 00:04:02 +02:00
@@ -520,18 +520,18 @@

        switch(cmd) {
        case WDIOC_GETSUPPORT:
-               i = copy_to_user((void*)arg, &ident, sizeof(ident));
+               i = copy_to_user((void __user *)arg, &ident, sizeof(ident));
                return i ? -EFAULT : 0;

        case WDIOC_SETTIMEOUT:
-               i = copy_from_user(&val, (void *) arg, sizeof(int));
+               i = copy_from_user(&val, (void __user *) arg, sizeof(int));
                if (i)
                        return -EFAULT;
                timeout = val;
                return ipmi_set_timeout(IPMI_SET_TIMEOUT_HB_IF_NECESSARY);

        case WDIOC_GETTIMEOUT:
-               i = copy_to_user((void *) arg,
+               i = copy_to_user((void __user *) arg,
                                 &timeout,
                                 sizeof(timeout));
                if (i)
@@ -539,14 +539,14 @@
                return 0;

        case WDIOC_SET_PRETIMEOUT:
-               i = copy_from_user(&val, (void *) arg, sizeof(int));
+               i = copy_from_user(&val, (void __user *) arg, sizeof(int));
                if (i)
                        return -EFAULT;
                pretimeout = val;
                return ipmi_set_timeout(IPMI_SET_TIMEOUT_HB_IF_NECESSARY);

        case WDIOC_GET_PRETIMEOUT:
-               i = copy_to_user((void *) arg,
+               i = copy_to_user((void __user *) arg,
                                 &pretimeout,
                                 sizeof(pretimeout));
                if (i)
@@ -557,7 +557,7 @@
                return ipmi_heartbeat();

        case WDIOC_SETOPTIONS:
-               i = copy_from_user(&val, (void *) arg, sizeof(int));
+               i = copy_from_user(&val, (void __user *) arg, sizeof(int));
                if (i)
                        return -EFAULT;
                if (val & WDIOS_DISABLECARD)
@@ -576,7 +576,7 @@

        case WDIOC_GETSTATUS:
                val = 0;
-               i = copy_to_user((void *) arg, &val, sizeof(val));
+               i = copy_to_user((void __user *) arg, &val, sizeof(val));
                if (i)
                        return -EFAULT;
                return 0;
@@ -587,7 +587,7 @@
 }

 static ssize_t ipmi_write(struct file *file,
-                         const char  *buf,
+                         const char  __user *buf,
                          size_t      len,
                          loff_t      *ppos)
 {
@@ -607,7 +607,7 @@
 }

 static ssize_t ipmi_read(struct file *file,
-                        char        *buf,
+                        char        __user *buf,
                         size_t      count,
                         loff_t      *ppos)
 {
===== drivers/char/mwave/mwavedd.c 1.13 vs edited =====
--- 1.13/drivers/char/mwave/mwavedd.c   2004-05-15 08:11:58 +02:00
+++ edited/drivers/char/mwave/mwavedd.c 2004-06-16 00:35:13 +02:00
@@ -164,7 +164,7 @@
                                " retval %x from tp3780I_QueryAbilities\n",
                                retval);
                        if (retval == 0) {
-                               if( copy_to_user((char *) ioarg,
+                               if( copy_to_user((char __user *) ioarg,
                                                        (char *) &rAbilities,
                                                        sizeof(MW_ABILITIES)) )
                                        return -EFAULT;
@@ -182,7 +182,7 @@
                        unsigned short *pusBuffer = 0;

                        if( copy_from_user((char *) &rReadData,
-                                               (char *) ioarg,
+                                               (char __user *) ioarg,
                                                sizeof(MW_READWRITE)) )
                                return -EFAULT;
                        pusBuffer = (unsigned short *) (rReadData.pBuf);
@@ -203,7 +203,7 @@
                        MW_READWRITE rReadData;
                        unsigned short *pusBuffer = 0;

-                       if( copy_from_user((char *) &rReadData, (char *) ioarg,
+                       if( copy_from_user((char *) &rReadData, (char __user *) ioarg,
                                                sizeof(MW_READWRITE)) )
                                return -EFAULT;
                        pusBuffer = (unsigned short *) (rReadData.pBuf);
@@ -225,7 +225,7 @@
                        unsigned short *pusBuffer = 0;

                        if( copy_from_user((char *) &rWriteData,
-                                               (char *) ioarg,
+                                               (char __user *) ioarg,
                                                sizeof(MW_READWRITE)) )
                                return -EFAULT;
                        pusBuffer = (unsigned short *) (rWriteData.pBuf);
@@ -247,7 +247,7 @@
                        unsigned short *pusBuffer = 0;

                        if( copy_from_user((char *) &rWriteData,
-                                               (char *) ioarg,
+                                               (char __user *) ioarg,
                                                sizeof(MW_READWRITE)) )
                                return -EFAULT;
                        pusBuffer = (unsigned short *) (rWriteData.pBuf);
===== drivers/char/watchdog/acquirewdt.c 1.29 vs edited =====
--- 1.29/drivers/char/watchdog/acquirewdt.c     2004-02-11 20:53:50 +01:00
+++ edited/drivers/char/watchdog/acquirewdt.c   2004-06-16 01:07:12 +02:00
@@ -111,7 +111,7 @@
  *     /dev/watchdog handling.
  */

-static ssize_t acq_write(struct file *file, const char *buf, size_t count, loff_t *ppos)
+static ssize_t acq_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 {
        /*  Can't seek (pwrite) on this device  */
        if (ppos != &file->f_pos)
@@ -156,22 +156,22 @@
        switch(cmd)
        {
        case WDIOC_GETSUPPORT:
-         return copy_to_user((struct watchdog_info *)arg, &ident, sizeof(ident)) ? -EFAULT : 0;
+         return copy_to_user((struct watchdog_info __user *)arg, &ident, sizeof(ident)) ? -EFAULT : 0;

        case WDIOC_GETSTATUS:
        case WDIOC_GETBOOTSTATUS:
-         return put_user(0, (int *)arg);
+         return put_user(0, (int __user *)arg);

        case WDIOC_KEEPALIVE:
          acq_keepalive();
          return 0;

        case WDIOC_GETTIMEOUT:
-         return put_user(WATCHDOG_HEARTBEAT, (int *)arg);
+         return put_user(WATCHDOG_HEARTBEAT, (int __user *)arg);

        case WDIOC_SETOPTIONS:
        {
-           if (get_user(options, (int *)arg))
+           if (get_user(options, (int __user *)arg))
              return -EFAULT;

            if (options & WDIOS_DISABLECARD)
===== drivers/char/watchdog/advantechwdt.c 1.22 vs edited =====
--- 1.22/drivers/char/watchdog/advantechwdt.c   2004-03-13 23:48:20 +01:00
+++ edited/drivers/char/watchdog/advantechwdt.c 2004-06-16 01:08:16 +02:00
@@ -100,7 +100,7 @@
 }

 static ssize_t
-advwdt_write(struct file *file, const char *buf, size_t count, loff_t *ppos)
+advwdt_write(struct file *file, const char __user *buf, size_t count, loff_t *ppos)
 {
        /*  Can't seek (pwrite) on this device  */
        if (ppos != &file->f_pos)
@@ -138,20 +138,20 @@

        switch (cmd) {
        case WDIOC_GETSUPPORT:
-         if (copy_to_user((struct watchdog_info *)arg, &ident, sizeof(ident)))
+         if (copy_to_user((struct watchdog_info __user *)arg, &ident, sizeof(ident)))
            return -EFAULT;
          break;

        case WDIOC_GETSTATUS:
        case WDIOC_GETBOOTSTATUS:
-         return put_user(0, (int *)arg);
+         return put_user(0, (int __user *)arg);

        case WDIOC_KEEPALIVE:
          advwdt_ping();
          break;

        case WDIOC_SETTIMEOUT:
-         if (get_user(new_timeout, (int *)arg))
+         if (get_user(new_timeout, (int __user *)arg))
                  return -EFAULT;
          if ((new_timeout < 1) || (new_timeout > 63))
                  return -EINVAL;
@@ -160,13 +160,13 @@
          /* Fall */

        case WDIOC_GETTIMEOUT:
-         return put_user(timeout, (int *)arg);
+         return put_user(timeout, (int __user *)arg);

        case WDIOC_SETOPTIONS:
        {
          int options, retval = -EINVAL;

-         if (get_user(options, (int *)arg))
+         if (get_user(options, (int __user *)arg))
            return -EFAULT;

          if (options & WDIOS_DISABLECARD) {



--===============97465973433625108==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97465973433625108==--
