From: Alexander Nyberg <alexn@telia.com>
Date: Tue, 15 Jun 2004 17:12:16 +0000
Subject: [Kernel-janitors] Sparse checks #1
Message-Id: <1087319535.676.45.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29844627024342074=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29844627024342074==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

All patches against current bk
this one much similar to Viro's work on drivers/block/floppy.c



Sparse checkings for drivers/block/floppy98.c

Signed-off-by: Alexander Nyberg <alexn@telia.com>

===== drivers/block/floppy98.c 1.17 vs edited =====
--- 1.17/drivers/block/floppy98.c       2004-05-22 10:23:01 +02:00
+++ edited/drivers/block/floppy98.c     2004-06-15 18:18:27 +02:00
@@ -3120,18 +3120,18 @@
  * Misc Ioctl's and support
  * ========================
  */
-static inline int fd_copyout(void *param, const void *address, unsigned long size)
+static inline int fd_copyout(void __user *param, const void *address, unsigned long size)
 {
        return copy_to_user(param,address, size) ? -EFAULT : 0;
 }

-static inline int fd_copyin(void *param, void *address, unsigned long size)
+static inline int fd_copyin(void __user *param, void *address, unsigned long size)
 {
        return copy_from_user(address, param, size) ? -EFAULT : 0;
 }

-#define _COPYOUT(x) (copy_to_user((void *)param, &(x), sizeof(x)) ? -EFAULT : 0)
-#define _COPYIN(x) (copy_from_user(&(x), (void *)param, sizeof(x)) ? -EFAULT : 0)
+#define _COPYOUT(x) (copy_to_user((void __user *)param, &(x), sizeof(x)) ? -EFAULT : 0)
+#define _COPYIN(x) (copy_from_user(&(x), (void __user *)param, sizeof(x)) ? -EFAULT : 0)

 #define COPYOUT(x) ECALL(_COPYOUT(x))
 #define COPYIN(x) ECALL(_COPYIN(x))
@@ -3209,7 +3209,7 @@
        raw_cmd_done
 };

-static inline int raw_cmd_copyout(int cmd, char *param,
+static inline int raw_cmd_copyout(int cmd, char __user *param,
                                  struct floppy_raw_cmd *ptr)
 {
        int ret;
@@ -3249,7 +3249,7 @@
 }


-static inline int raw_cmd_copyin(int cmd, char *param,
+static inline int raw_cmd_copyin(int cmd, char __user *param,
                                 struct floppy_raw_cmd **rcmd)
 {
        struct floppy_raw_cmd *ptr;
@@ -3304,7 +3304,7 @@
 }


-static int raw_cmd_ioctl(int cmd, void *param)
+static int raw_cmd_ioctl(int cmd, void __user *param)
 {
        int drive, ret, ret2;
        struct floppy_raw_cmd *my_raw_cmd;
@@ -3551,7 +3551,7 @@
        /* copyin */
        CLEARSTRUCT(&inparam);
        if (_IOC_DIR(cmd) & _IOC_WRITE)
-               ECALL(fd_copyin((void *)param, &inparam, size))
+               ECALL(fd_copyin((void __user *)param, &inparam, size))

        switch (cmd) {
                case FDEJECT:
@@ -3671,7 +3671,7 @@
                                return -EINVAL;
                        LOCK_FDC(drive,1);
                        set_floppy(drive);
-                       CALL(i = raw_cmd_ioctl(cmd,(void *) param));
+                       CALL(i = raw_cmd_ioctl(cmd, (void __user *) param));
                        process_fd_request();
                        return i;

@@ -3686,7 +3686,7 @@
        }

        if (_IOC_DIR(cmd) & _IOC_READ)
-               return fd_copyout((void *)param, outparam, size);
+               return fd_copyout((void __user *)param, outparam, size);
        else
                return 0;
 #undef OUT


--===============29844627024342074==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29844627024342074==--
