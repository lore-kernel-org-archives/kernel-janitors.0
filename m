From: Amit Gud <amitg@calsoftinc.com>
Date: Thu, 20 Jan 2005 15:40:36 +0000
Subject: [KJ] [PATCH] unified spinlock initialization
Message-Id: <200501202058.40041.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76910718621706708=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20050120153602.GI25940@parcelfarce.linux.theplanet.co.uk>
To: kernel-janitors@vger.kernel.org

--===============76910718621706708==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Unify the spinlock initialization as far as possible.

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>


--- vanilla-2.6.10/arch/um/drivers/ubd_kern.c	2005-01-20 20:08:30.000000000 +0530
+++ linux-2.6.10/arch/um/drivers/ubd_kern.c	2005-01-20 20:03:08.000000000 +0530
@@ -54,8 +54,8 @@
 #include "mem.h"
 #include "mem_kern.h"
 
-static spinlock_t ubd_io_lock = SPIN_LOCK_UNLOCKED;
-static spinlock_t ubd_lock = SPIN_LOCK_UNLOCKED;
+static spinlock_t ubd_io_lock;
+static spinlock_t ubd_lock;
 
 static void (*do_ubd)(void);
 
@@ -744,6 +744,9 @@ int ubd_init(void)
 {
         int i;
 
+	spin_lock_init(&ubd_lock);
+	spin_lock_init(&ubd_io_lock);
+
 	devfs_mk_dir("ubd");
 	if (register_blkdev(MAJOR_NR, "ubd"))
 		return -1;


--===============76910718621706708==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76910718621706708==--
