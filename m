From: Henne <henne@nachtwindheim.de>
Date: Tue, 04 Jul 2006 12:10:20 +0000
Subject: [KJ] [PATCH] kernel-doc for fs/super.c
Message-Id: <44AA5AAC.7090903@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Henrik Kretzschmar <henne@nachtwindheim.de>

Adds kernel-doc for alloc_super() type in fs/super.c.
Signed-off-by: Henrik Kretzschmar <henne@nachtwindheim.de>
---

--- linux-2.6.17-git22/fs/super.c	2006-07-04 11:12:16.000000000 +0200
+++ linux/fs/super.c	2006-07-04 14:07:00.000000000 +0200
@@ -49,6 +49,7 @@

 /**
  *	alloc_super	-	create new superblock
+ *	@type:	filesystem type superblock should belong to
  *
  *	Allocates and initializes a new &struct super_block.  alloc_super()
  *	returns a pointer new superblock or %NULL if allocation had failed.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
