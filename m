From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Jan 2013 06:41:43 +0000
Subject: [patch] staging: cxt1e1: buffer overflow in do_del_chan()
Message-Id: <20130124064143.GC5611@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If we don't restrict "cp.channum" to 3 digits then the sprintf() will
overflow.  I've added a check and changed the sprintf() to snprintf().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/cxt1e1/linux.c b/drivers/staging/cxt1e1/linux.c
index 0ff2865..a829b62 100644
--- a/drivers/staging/cxt1e1/linux.c
+++ b/drivers/staging/cxt1e1/linux.c
@@ -773,7 +773,9 @@ do_del_chan (struct net_device * musycc_dev, void *data)
     if (copy_from_user (&cp, data,
                         sizeof (struct sbecom_chan_param)))
         return -EFAULT;
-    sprintf (buf, CHANNAME "%d", cp.channum);
+    if (cp.channum > 999)
+        return -EINVAL;
+    snprintf (buf, sizeof(buf), CHANNAME "%d", cp.channum);
     if (!(dev = dev_get_by_name (&init_net, buf)))
         return -ENOENT;
     dev_put (dev);
