From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 27 Jan 2006 10:41:15 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in block/elevator.c
Message-Id: <1138358475.15194.0.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26912494297357448=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26912494297357448==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/block/elevator.c.orig	2006-01-27 11:09:08.000000000 +0100
+++ linux-2.6.16-rc1-git4/block/elevator.c	2006-01-27 11:09:40.000000000 +0100
@@ -663,8 +663,7 @@ void elv_unregister_queue(struct request
 int elv_register(struct elevator_type *e)
 {
 	spin_lock_irq(&elv_list_lock);
-	if (elevator_find(e->elevator_name))
-		BUG();
+	BUG_ON(elevator_find(e->elevator_name));
 	list_add_tail(&e->list, &elv_list);
 	spin_unlock_irq(&elv_list_lock);
 



--===============26912494297357448==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26912494297357448==--
