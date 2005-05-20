From: Jesse Millan <jessem@cs.pdx.edu>
Date: Fri, 20 May 2005 18:53:24 +0000
Subject: [KJ] [PATCH] Fix gcc4 warning,
Message-Id: <428E3224.8030307@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------000803070103080802020506"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------000803070103080802020506
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


This patch eliminates the warning that is generated when passing an
uninitialized variable to a function, and in that function it 'looks'
like you may read the contents.

In this case, the address of a local variable 'idx' is passed to the
function bvec_alloc_bs(). Inside bvec_alloc_bs(), it is possible that
no value will be assigned to idx, in which case the function immediately
returns null and does not go on to read it. Human eyes can see that its
safe. Initializing it doen not hurt and it gets rid of the compiler warning.

--------------000803070103080802020506
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc4/fs/bio.c~	2005-05-20 11:24:39.163613256 -0700
+++ linux-2.6.12-rc4/fs/bio.c	2005-05-20 11:25:35.242185201 -0700
@@ -159,7 +159,7 @@ struct bio *bio_alloc_bioset(unsigned in

 		bio_init(bio);
 		if (likely(nr_iovecs)) {
-			unsigned long idx;
+			unsigned long idx = 0;

 			bvl = bvec_alloc_bs(gfp_mask, nr_iovecs, &idx, bs);
 			if (unlikely(!bvl)) {

--------------000803070103080802020506
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------000803070103080802020506--
