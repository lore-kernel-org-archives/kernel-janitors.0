From: Domen Puncer <domen@coderock.org>
Date: Wed, 17 Nov 2004 13:26:28 +0000
Subject: [KJ] [patch] fs/super.c: docbook comment fix
Message-Id: <20041117132628.GF8698@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81657208050279495=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============81657208050279495==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Parameter name in comment was wrong.

Compile tested.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/fs/super.c	2004-11-15 13:42:18.000000000 +0100
+++ a/fs/super.c	2004-11-17 14:08:44.000000000 +0100
@@ -141,7 +141,7 @@ int __put_super_and_need_restart(struct 
 
 /**
  *	put_super	-	drop a temporary reference to superblock
- *	@s: superblock in question
+ *	@sb: superblock in question
  *
  *	Drops a temporary reference, frees superblock if there's no
  *	references left.

--===============81657208050279495==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81657208050279495==--
