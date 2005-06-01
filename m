From: Jesse Millan <jessem@cs.pdx.edu>
Date: Wed, 01 Jun 2005 21:35:26 +0000
Subject: [KJ] [PATCH] Fix misleading gcc4 warning,
Message-Id: <429E2A1E.9080803@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040402090301010904080000"
List-Id: <kernel-janitors.vger.kernel.org>
References: <42966B18.6020802@cs.pdx.edu>
In-Reply-To: <42966B18.6020802@cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040402090301010904080000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


This warning is a false alarm.

This patch eliminates the warning that idx may be used uninitialized in
the function bvec_alloc_bs().



--------------040402090301010904080000
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc5.kj/fs/bio.c~	2005-06-01 14:07:53.296359331 -0700
+++ linux-2.6.12-rc5.kj/fs/bio.c	2005-06-01 14:22:44.191467330 -0700
@@ -78,6 +78,7 @@ static inline struct bio_vec *bvec_alloc
 {
 	struct bio_vec *bvl;
 	struct biovec_slab *bp;
+	*idx = 0;

 	/*
 	 * see comment near bvec_array define!


--------------040402090301010904080000
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040402090301010904080000--
