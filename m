From: Jesse Millan <jessem@cs.pdx.edu>
Date: Wed, 25 May 2005 06:09:21 +0000
Subject: [KJ] [PATCH] Fix gcc4 warning,
Message-Id: <42941691.3010507@cs.pdx.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050705000609030203070204"
List-Id: <kernel-janitors.vger.kernel.org>
References: <428E3224.8030307@cs.pdx.edu>
In-Reply-To: <428E3224.8030307@cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050705000609030203070204
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Same as the last. This patch eliminates the warning that is generated
when passing a reference of an uninitialized variable to a function
where it possible that the function will return without initializing
that variable.

The first execution path leaves both def and len uninitialized. The
second leaves len uninitialized. In both cases, initializing them when
they otherwise would not have been is close to pointless because they
would not get used anyway. The change is only to suppress the compiler
warning.

--------------050705000609030203070204
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="patch"

Signed-off-by: Jesse Millan <jessem@cs.pdx.edu>

--- linux-2.6.12-rc4/fs/cifs/asn1.c~	2005-05-24 22:25:21.436866468 -0700
+++ linux-2.6.12-rc4/fs/cifs/asn1.c	2005-05-24 22:49:43.744939729 -0700
@@ -160,12 +160,18 @@ asn1_length_decode(struct asn1_ctx *ctx,
 {
 	unsigned char ch, cnt;

-	if (!asn1_octet_decode(ctx, &ch))
+	if (!asn1_octet_decode(ctx, &ch)) {
+		/* Function would have returned without initializing 'def' and 'len' */
+		*def = 0;
+		*len = 0;
 		return 0;
+	}

-	if (ch == 0x80)
+	if (ch == 0x80) {
 		*def = 0;
-	else {
+		/* Function would have returned without initializing 'len' */
+		*len = 0;
+	} else {
 		*def = 1;

 		if (ch < 0x80)

--------------050705000609030203070204
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------050705000609030203070204--
