From: Nicolas Kaiser <nikai@nikai.net>
Date: Tue, 08 Feb 2005 02:37:07 +0000
Subject: [KJ] [PATCH] scripts/mod/sumversion.c: replace strtok() with
Message-Id: <20050208033707.5344b2fd@lucky.kitzblitz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86638763194601287=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86638763194601287==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi there,

I just read about the strtok() replacement at
 http://janitor.kernelnewbies.org/docs/driver-howto.html#3.3.1
and found one occurrence. He, the example code gives me a
warning about a missing pair of brackets :)
Patch below compiles without warning, runs without problems.

Did I miss anything?

Cheers,
n.


Description: Replaces strtok() with strsep()

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>

--- scripts/mod/sumversion.c.orig	2005-02-08 01:53:38.540759616 +0100
+++ scripts/mod/sumversion.c	2005-02-08 02:30:36.514576344 +0100
@@ -419,7 +419,9 @@
 	*end = '\0';
 
 	md4_init(&md);
-	for (fname = strtok(sources, " "); fname; fname = strtok(NULL, " ")) {
+	while ((fname = strsep(&sources, " ")) != NULL) {
+		if (!fname)
+			continue;
 		if (!parse_source_files(fname, &md))
 			goto release;
 	}

--===============86638763194601287==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86638763194601287==--
