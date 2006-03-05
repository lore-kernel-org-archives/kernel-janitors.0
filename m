From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Sun, 05 Mar 2006 15:02:20 +0000
Subject: [KJ] [Patch] kzalloc() conversion in crypto/
Message-Id: <1141570941.13183.16.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85941263380166655=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85941263380166655==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts crypto/ to kzalloc usage.
Compile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/crypto/api.c.orig	2006-03-05 09:42:30.000000000 +0100
+++ linux-2.6.16-rc5-mm1/crypto/api.c	2006-03-05 09:42:48.000000000 +0100
@@ -179,12 +179,10 @@ struct crypto_tfm *crypto_alloc_tfm(cons
 		goto out;
 
 	tfm_size = sizeof(*tfm) + crypto_ctxsize(alg, flags);
-	tfm = kmalloc(tfm_size, GFP_KERNEL);
+	tfm = kzalloc(tfm_size, GFP_KERNEL);
 	if (tfm == NULL)
 		goto out_put;
 
-	memset(tfm, 0, tfm_size);
-	
 	tfm->__crt_alg = alg;
 	
 	if (crypto_init_flags(tfm, flags))
--- linux-2.6.16-rc5-mm1/crypto/deflate.c.orig	2006-03-05 09:42:53.000000000 +0100
+++ linux-2.6.16-rc5-mm1/crypto/deflate.c	2006-03-05 09:44:33.000000000 +0100
@@ -73,12 +73,11 @@ static int deflate_decomp_init(struct de
 	int ret = 0;
 	struct z_stream_s *stream = &ctx->decomp_stream;
 
-	stream->workspace = kmalloc(zlib_inflate_workspacesize(), GFP_KERNEL);
+	stream->workspace = kzalloc(zlib_inflate_workspacesize(), GFP_KERNEL);
 	if (!stream->workspace ) {
 		ret = -ENOMEM;
 		goto out;
 	}
-	memset(stream->workspace, 0, zlib_inflate_workspacesize());
 	ret = zlib_inflateInit2(stream, -DEFLATE_DEF_WINBITS);
 	if (ret != Z_OK) {
 		ret = -EINVAL;



--===============85941263380166655==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85941263380166655==--
