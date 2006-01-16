From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 16 Jan 2006 20:53:12 +0000
Subject: [KJ] [Patch] change if() BUG(); to BUG_ON() in mm/pdflush.c
Message-Id: <1137444792.2510.1.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52950044269192276=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52950044269192276==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes an if() BUG(); statement to
BUG_ON() in mm/pdflush.c

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git11/mm/pdflush.c.orig	2006-01-16 21:49:55.000000000 +0100
+++ linux-2.6.15-git11/mm/pdflush.c	2006-01-16 21:50:27.000000000 +0100
@@ -202,8 +202,7 @@ int pdflush_operation(void (*fn)(unsigne
 	unsigned long flags;
 	int ret = 0;
 
-	if (fn == NULL)
-		BUG();		/* Hard to diagnose if it's deferred */
+	BUG_ON(fn == NULL);	/* Hard to diagnose if it's deferred */
 
 	spin_lock_irqsave(&pdflush_lock, flags);
 	if (list_empty(&pdflush_list)) {



--===============52950044269192276==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52950044269192276==--
