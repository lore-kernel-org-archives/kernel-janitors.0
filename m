From: Nicolas Kaiser <nikai@nikai.net>
Date: Tue, 08 Feb 2005 11:27:55 +0000
Subject: [KJ] [UPDATE PATCH] scripts/mod/sumversion.c: replace strtok() with
Message-Id: <20050208122755.4e41724e@lucky.kitzblitz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72394657328297507=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72394657328297507==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

* Nicolas Kaiser <nikai@nikai.net>:
>  http://janitor.kernelnewbies.org/docs/driver-howto.html#3.3.1

> Did I miss anything?

Actually, I did miss something. Here comes an update.

Did I miss anything else?

Cheers,
n.


 Description: Replaces strtok() with strsep()
 
 Signed-off-by: Nicolas Kaiser <nikai@nikai.net>

--- scripts/mod/sumversion.c.orig	2005-02-08 01:53:38.000000000 +0100
+++ scripts/mod/sumversion.c	2005-02-08 12:13:49.614979976 +0100
@@ -419,7 +419,9 @@
 	*end = '\0';
 
 	md4_init(&md);
-	for (fname = strtok(sources, " "); fname; fname = strtok(NULL, " ")) {
+	while ((fname = strsep(&sources, " ")) != NULL) {
+		if (!*fname)
+			continue;
 		if (!parse_source_files(fname, &md))
 			goto release;
 	}

--===============72394657328297507==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72394657328297507==--
