From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 08:41:37 +0000
Subject: [KJ] [Patch] kzalloc() conversion in ipc/
Message-Id: <1141548097.6426.8.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94192833169439094=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94192833169439094==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts ipc/ to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/ipc/sem.c.orig	2006-03-04 21:55:26.000000000 +0100
+++ linux-2.6.16-rc5-mm1/ipc/sem.c	2006-03-04 21:55:42.000000000 +0100
@@ -946,10 +946,9 @@ static inline int get_undo_list(struct s
 	undo_list = current->sysvsem.undo_list;
 	if (!undo_list) {
 		size = sizeof(struct sem_undo_list);
-		undo_list = (struct sem_undo_list *) kmalloc(size, GFP_KERNEL);
+		undo_list = kzalloc(size, GFP_KERNEL);
 		if (undo_list == NULL)
 			return -ENOMEM;
-		memset(undo_list, 0, size);
 		spin_lock_init(&undo_list->lock);
 		atomic_set(&undo_list->refcnt, 1);
 		current->sysvsem.undo_list = undo_list;



--===============94192833169439094==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94192833169439094==--
