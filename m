From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Date: Wed, 11 Apr 2007 07:19:51 +0000
Subject: [KJ] [PATCH] HYSDN cards: use spin_lock_init() for spinlock
Message-Id: <20070411071951.GJ24898@traven>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

HYSDN cards: use spin_lock_init() for spinlock initialization

Signed-off-by: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
---
diff --git a/drivers/isdn/hysdn/hysdn_proclog.c b/drivers/isdn/hysdn/hysdn_proclog.c
index f7e83a8..168fd56 100644
--- a/drivers/isdn/hysdn/hysdn_proclog.c
+++ b/drivers/isdn/hysdn/hysdn_proclog.c
@@ -299,7 +299,8 @@ hysdn_log_close(struct inode *ino, struct file *filep)
 	hysdn_card *card;
 	int retval = 0;
 	unsigned long flags;
-	spinlock_t hysdn_lock = SPIN_LOCK_UNLOCKED;
+	spinlock_t hysdn_lock;
+	spin_lock_init(&hysdn_lock);
 
 	lock_kernel();
 	if ((filep->f_mode & (FMODE_READ | FMODE_WRITE)) = FMODE_WRITE) {

-- 
Matthias Kaehlcke
Linux Application Developer
Barcelona


   Usually when people are sad, they don't do anything. They just cry over
     their condition. But when they get angry, they bring about a change
                              (Malcolm X)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
