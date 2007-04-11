From: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>
Date: Wed, 11 Apr 2007 17:09:07 +0000
Subject: [KJ] [PATCH] fixed spinlock use in hysdn_log_close()
Message-Id: <20070411170907.GO24898@traven>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: kkeil@suse.de, kai.germaschewski@gmx.de, isdn4linux@listserv.isdn4linux.de

fixed incorrect spinlock use in hysdn_log_close(). the function
declared a spinlock on the stack and used it to 'protect' a shared
driver structure. the patch removes the declaration of hysdn_lock and 
uses card->hysdn_lock instead.

Signed-off-by: Matthias Kaehlcke <matthias.kaehlcke@gmail.com>

---
diff --git a/drivers/isdn/hysdn/hysdn_proclog.c b/drivers/isdn/hysdn/hysdn_proclog.c
index f7e83a8..32f0b75 100644
--- a/drivers/isdn/hysdn/hysdn_proclog.c
+++ b/drivers/isdn/hysdn/hysdn_proclog.c
@@ -299,7 +299,6 @@ hysdn_log_close(struct inode *ino, struct file *filep)
 	hysdn_card *card;
 	int retval = 0;
 	unsigned long flags;
-	spinlock_t hysdn_lock = SPIN_LOCK_UNLOCKED;
 
 	lock_kernel();
 	if ((filep->f_mode & (FMODE_READ | FMODE_WRITE)) = FMODE_WRITE) {
@@ -309,7 +308,7 @@ hysdn_log_close(struct inode *ino, struct file *filep)
 		/* read access -> log/debug read, mark one further file as closed */
 
 		pd = NULL;
-		spin_lock_irqsave(&hysdn_lock, flags);
+		spin_lock_irqsave(&card->hysdn_lock, flags);
 		inf = *((struct log_data **) filep->private_data);	/* get first log entry */
 		if (inf)
 			pd = (struct procdata *) inf->proc_ctrl;	/* still entries there */
@@ -332,7 +331,7 @@ hysdn_log_close(struct inode *ino, struct file *filep)
 			inf->usage_cnt--;	/* decrement usage count for buffers */
 			inf = inf->next;
 		}
-		spin_unlock_irqrestore(&hysdn_lock, flags);
+		spin_unlock_irqrestore(&card->hysdn_lock, flags);
 
 		if (pd)
 			if (pd->if_used <= 0)	/* delete buffers if last file closed */

-- 
Matthias Kaehlcke
Linux Application Developer
Barcelona

      In itself, homosexuality is as limiting as heterosexuality: the
     ideal should be to be capable of loving a woman or a man; either,
      a human being, without  feeling fear, restraint, or obligation
                          (Simone de Beauvoir)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
