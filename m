From: Alexander Nyberg <alexn@telia.com>
Date: Tue, 15 Jun 2004 17:12:50 +0000
Subject: [Kernel-janitors] Sparse checks #3
Message-Id: <1087319570.676.50.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90131339830727675=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============90131339830727675==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sparse checkings for arch/um/drivers/ubd_kern.c

Signed-off-by: Alexander Nyberg <alexn@telia.com>

===== arch/um/drivers/ubd_kern.c 1.35 vs edited =====
--- 1.35/arch/um/drivers/ubd_kern.c     2003-09-05 13:31:49 +02:00
+++ edited/arch/um/drivers/ubd_kern.c   2004-06-15 16:20:25 +02:00
@@ -868,7 +868,7 @@
 static int ubd_ioctl(struct inode * inode, struct file * file,
                     unsigned int cmd, unsigned long arg)
 {
-       struct hd_geometry *loc = (struct hd_geometry *) arg;
+       struct hd_geometry __user *loc = (struct hd_geometry __user *) arg;
        struct ubd *dev = inode->i_bdev->bd_disk->private_data;
        int err;
        struct hd_driveid ubd_id = {
@@ -896,14 +896,14 @@

        case HDIO_GET_UNMASKINTR:
                if(!arg)  return(-EINVAL);
-               err = verify_area(VERIFY_WRITE, (long *) arg, sizeof(long));
+               err = verify_area(VERIFY_WRITE, (long __user *) arg, sizeof(long));
                if(err)
                        return(err);
                return(0);

        case HDIO_GET_MULTCOUNT:
                if(!arg)  return(-EINVAL);
-               err = verify_area(VERIFY_WRITE, (long *) arg, sizeof(long));
+               err = verify_area(VERIFY_WRITE, (long __user *) arg, sizeof(long));
                if(err)
                        return(err);
                return(0);
@@ -916,19 +916,19 @@

        case HDIO_GET_IDENTITY:
                ubd_id.cyls = dev->size / (128 * 32 * 512);
-               if(copy_to_user((char *) arg, (char *) &ubd_id,
+               if(copy_to_user((char __user *) arg, (char *) &ubd_id,
                                 sizeof(ubd_id)))
                        return(-EFAULT);
                return(0);

        case CDROMVOLREAD:
-               if(copy_from_user(&volume, (char *) arg, sizeof(volume)))
+               if(copy_from_user(&volume, (char __user *) arg, sizeof(volume)))
                        return(-EFAULT);
                volume.channel0 = 255;
                volume.channel1 = 255;
                volume.channel2 = 255;
                volume.channel3 = 255;
-               if(copy_to_user((char *) arg, &volume, sizeof(volume)))
+               if(copy_to_user((char __user *) arg, &volume, sizeof(volume)))
                        return(-EFAULT);
                return(0);
        }


--===============90131339830727675==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90131339830727675==--
