From: Alexander Nyberg <alexn@telia.com>
Date: Tue, 15 Jun 2004 23:44:59 +0000
Subject: [Kernel-janitors] Sparse checks #8
Message-Id: <1087343092.676.113.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49865091548047591=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49865091548047591==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sparse checks for drivers/

Signed-off-by: Alexander Nyberg <alexn@telia.com>

===== drivers/char/viotape.c 1.3 vs edited =====
--- 1.3/drivers/char/viotape.c  2004-04-22 10:40:36 +02:00
+++ edited/drivers/char/viotape.c       2004-06-16 01:05:25 +02:00
@@ -429,7 +429,7 @@


 /* Write */
-static ssize_t viotap_write(struct file *file, const char *buf,
+static ssize_t viotap_write(struct file *file, const char __user *buf,
                size_t count, loff_t * ppos)
 {
        HvLpEvent_Rc hvrc;
@@ -518,7 +518,7 @@
 }

 /* read */
-static ssize_t viotap_read(struct file *file, char *buf, size_t count,
+static ssize_t viotap_read(struct file *file, char __user *buf, size_t count,
                loff_t *ptr)
 {
        HvLpEvent_Rc hvrc;
@@ -625,7 +625,7 @@
                 */
                if (inode == NULL)
                        memcpy(&mtc, (void *) arg, sizeof(struct mtop));
-               else if (copy_from_user((char *)&mtc, (char *)arg,
+               else if (copy_from_user((char *)&mtc, (char __user *)arg,
                                        sizeof(struct mtop)))
                        goto free_op;

@@ -745,7 +745,7 @@
                free_op_struct(op);
                up(&reqSem);

-               if ((ret == 0) && copy_to_user((void *)arg,
+               if ((ret == 0) && copy_to_user((void __user *)arg,
                                        &viomtget[devi.devno],
                                        sizeof(viomtget[0])))
                        ret = -EFAULT;
@@ -871,12 +871,12 @@
 }

 struct file_operations viotap_fops = {
-       owner: THIS_MODULE,
-       read: viotap_read,
-       write: viotap_write,
-       ioctl: viotap_ioctl,
-       open: viotap_open,
-       release: viotap_release,
+       .owner = THIS_MODULE,
+       .read = viotap_read,
+       .write = viotap_write,
+       .ioctl = viotap_ioctl,
+       .open = viotap_open,
+       .release = viotap_release,
 };

 /* Handle interrupt events for tape */
===== drivers/char/ipmi/ipmi_devintf.c 1.10 vs edited =====
--- 1.10/drivers/char/ipmi/ipmi_devintf.c       2004-04-12 19:54:18 +02:00
+++ edited/drivers/char/ipmi/ipmi_devintf.c     2004-06-16 00:00:51 +02:00
@@ -238,7 +238,7 @@
        {
                struct ipmi_req req;

-               if (copy_from_user(&req, (void *) data, sizeof(req))) {
+               if (copy_from_user(&req, (void __user *) data, sizeof(req))) {
                        rv = -EFAULT;
                        break;
                }
@@ -254,7 +254,7 @@
        {
                struct ipmi_req_settime req;

-               if (copy_from_user(&req, (void *) data, sizeof(req))) {
+               if (copy_from_user(&req, (void __user *) data, sizeof(req))) {
                        rv = -EFAULT;
                        break;
                }
@@ -277,7 +277,7 @@


                rv = 0;
-               if (copy_from_user(&rsp, (void *) data, sizeof(rsp))) {
+               if (copy_from_user(&rsp, (void __user *) data, sizeof(rsp))) {
                        rv = -EFAULT;
                        break;
                }
@@ -344,7 +344,7 @@
                        rsp.msg.data_len = 0;
                }

-               if (copy_to_user((void *) data, &rsp, sizeof(rsp))) {
+               if (copy_to_user((void __user *) data, &rsp, sizeof(rsp))) {
                        rv = -EFAULT;
                        goto recv_putback_on_err;
                }
@@ -371,7 +371,7 @@
        {
                struct ipmi_cmdspec val;

-               if (copy_from_user(&val, (void *) data, sizeof(val))) {
+               if (copy_from_user(&val, (void __user *) data, sizeof(val))) {
                        rv = -EFAULT;
                        break;
                }
@@ -384,7 +384,7 @@
        {
                struct ipmi_cmdspec   val;

-               if (copy_from_user(&val, (void *) data, sizeof(val))) {
+               if (copy_from_user(&val, (void __user *) data, sizeof(val))) {
                        rv = -EFAULT;
                        break;
                }
@@ -397,7 +397,7 @@
        {
                int val;

-               if (copy_from_user(&val, (void *) data, sizeof(val))) {
+               if (copy_from_user(&val, (void __user *) data, sizeof(val))) {
                        rv = -EFAULT;
                        break;
                }
@@ -410,7 +410,7 @@
        {
                unsigned int val;

-               if (copy_from_user(&val, (void *) data, sizeof(val))) {
+               if (copy_from_user(&val, (void __user *) data, sizeof(val))) {
                        rv = -EFAULT;
                        break;
                }
@@ -426,7 +426,7 @@

                val = ipmi_get_my_address(priv->user);

-               if (copy_to_user((void *) data, &val, sizeof(val))) {
+               if (copy_to_user((void __user *) data, &val, sizeof(val))) {
                        rv = -EFAULT;
                        break;
                }
@@ -438,7 +438,7 @@
        {
                unsigned int val;

-               if (copy_from_user(&val, (void *) data, sizeof(val))) {
+               if (copy_from_user(&val, (void __user *) data, sizeof(val))) {
                        rv = -EFAULT;
                        break;
                }
@@ -454,7 +454,7 @@

                val = ipmi_get_my_LUN(priv->user);

-               if (copy_to_user((void *) data, &val, sizeof(val))) {
+               if (copy_to_user((void __user *) data, &val, sizeof(val))) {
                        rv = -EFAULT;
                        break;
                }
@@ -465,7 +465,7 @@
        {
                struct ipmi_timing_parms parms;

-               if (copy_from_user(&parms, (void *) data, sizeof(parms))) {
+               if (copy_from_user(&parms, (void __user *) data, sizeof(parms))) {
                        rv = -EFAULT;
                        break;
                }
@@ -483,7 +483,7 @@
                parms.retries = priv->default_retries;
                parms.retry_time_ms = priv->default_retry_time_ms;

-               if (copy_to_user((void *) data, &parms, sizeof(parms))) {
+               if (copy_to_user((void __user *) data, &parms, sizeof(parms))) {
                        rv = -EFAULT;
                        break;
                }



--===============49865091548047591==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49865091548047591==--
