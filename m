From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 09:32:47 +0000
Subject: [KJ] [Patch 6/12] BUG_ON() Conversion in fs/jffs2/
Message-Id: <1138354368.7391.54.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53927272575135254=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============53927272575135254==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/fs/jffs2/background.c.orig	2006-01-27 01:35:43.000000000 +0100
+++ linux-2.6.16-rc1-git4/fs/jffs2/background.c	2006-01-27 01:35:57.000000000 +0100
@@ -35,8 +35,7 @@ int jffs2_start_garbage_collect_thread(s
 	pid_t pid;
 	int ret = 0;
 
-	if (c->gc_task)
-		BUG();
+	BUG_ON(c->gc_task);
 
 	init_completion(&c->gc_thread_start);
 	init_completion(&c->gc_thread_exit);



--===============53927272575135254==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53927272575135254==--
