From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Wed, 09 Mar 2005 22:50:37 +0000
Subject: [KJ] [PATCH 3/] arch/i386/kernel/apm.c: fix sparse warnings
Message-Id: <200503100124.58450.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============030572036238319722=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============030572036238319722==
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Alexey Dobriyan <adobriyan@mail.ru>

Index: linux-2.6.11-bk1-sparse/arch/i386/kernel/apm.c
===================================================================
--- linux-2.6.11-bk1-sparse.orig/arch/i386/kernel/apm.c	2005-03-02 09:37:47.000000000 +0200
+++ linux-2.6.11-bk1-sparse/arch/i386/kernel/apm.c	2005-03-06 03:34:27.000000000 +0200
@@ -346,10 +346,10 @@ extern int (*console_blank_hook)(int);
 struct apm_user {
 	int		magic;
 	struct apm_user *	next;
-	int		suser: 1;
-	int		writer: 1;
-	int		reader: 1;
-	int		suspend_wait: 1;
+	unsigned int	suser: 1;
+	unsigned int	writer: 1;
+	unsigned int	reader: 1;
+	unsigned int	suspend_wait: 1;
 	int		suspend_result;
 	int		suspends_pending;
 	int		standbys_pending;

--===============030572036238319722==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============030572036238319722==--
