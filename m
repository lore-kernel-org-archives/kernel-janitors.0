From: Domen Puncer <domen@coderock.org>
Date: Sat, 23 Oct 2004 19:48:54 +0000
Subject: [KJ] [patch] jbd: remove comment in journal.c
Message-Id: <20041023194854.GB3628@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88811118643983633=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88811118643983633==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Remove doubled comment, fix typo.

Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/fs/jbd/journal.c	2004-10-23 21:40:28.000000000 +0200
+++ test/fs/jbd/journal.c	2004-10-23 21:43:58.000000000 +0200
@@ -1575,11 +1575,7 @@ int journal_blocks_per_page(struct inode
 }
 
 /*
- * Simple support for retying memory allocations.  Introduced to help to
- * debug different VM deadlock avoidance strategies. 
- */
-/*
- * Simple support for retying memory allocations.  Introduced to help to
+ * Simple support for retrying memory allocations.  Introduced to help to
  * debug different VM deadlock avoidance strategies. 
  */
 void * __jbd_kmalloc (const char *where, size_t size, int flags, int retry)

--===============88811118643983633==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88811118643983633==--
