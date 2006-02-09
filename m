From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 09 Feb 2006 17:29:38 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in drivers/char
Message-Id: <1139506178.6417.0.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35214663402416946=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============35214663402416946==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc2-git2/drivers/char/tty_io.c.orig	2006-02-09 18:26:37.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/char/tty_io.c	2006-02-09 18:27:20.000000000 +0100
@@ -538,14 +538,12 @@ void tty_ldisc_put(int disc)
 	struct tty_ldisc *ld;
 	unsigned long flags;
 	
-	if (disc < N_TTY || disc >= NR_LDISCS)
-		BUG();
+	BUG_ON(disc < N_TTY || disc >= NR_LDISCS);
 		
 	spin_lock_irqsave(&tty_ldisc_lock, flags);
 	ld = &tty_ldiscs[disc];
-	if(ld->refcount == 0)
-		BUG();
-	ld->refcount --;
+	BUG_ON(ld->refcount == 0);
+	ld->refcount--;
 	module_put(ld->owner);
 	spin_unlock_irqrestore(&tty_ldisc_lock, flags);
 }
@@ -640,8 +638,7 @@ void tty_ldisc_deref(struct tty_ldisc *l
 {
 	unsigned long flags;
 
-	if(ld == NULL)
-		BUG();
+	BUG_ON(ld == NULL);
 		
 	spin_lock_irqsave(&tty_ldisc_lock, flags);
 	if(ld->refcount == 0)
--- linux-2.6.16-rc2-git2/drivers/char/epca.c.orig	2006-02-09 18:27:31.000000000 +0100
+++ linux-2.6.16-rc2-git2/drivers/char/epca.c	2006-02-09 18:27:48.000000000 +0100
@@ -486,8 +486,7 @@ static void pc_close(struct tty_struct *
 		} /* End channel is open more than once */
 
 		/* Port open only once go ahead with shutdown & reset */
-		if (ch->count < 0)
-			BUG();
+		BUG_ON(ch->count < 0);
 
 		/* ---------------------------------------------------------------
 			Let the rest of the driver know the channel is being closed.



--===============35214663402416946==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35214663402416946==--
