From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 05 Oct 2005 20:45:41 +0000
Subject: [KJ] [PATCH] cris: kgdb: remove double_this()
Message-Id: <20051005204541.GB27229@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74437632960426026=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74437632960426026==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Doesn't have C&C warning.
* Unused.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/cris/arch-v10/kernel/kgdb.c |    6 ------
 1 file changed, 6 deletions(-)

--- ./arch/cris/arch-v10/kernel/kgdb.c
+++ ./arch/cris/arch-v10/kernel/kgdb.c
@@ -569,12 +569,6 @@ gdb_cris_strtol (const char *s, char **e
 	return x;
 }
 
-int
-double_this(int x)
-{
-        return 2 * x;
-}
-
 /********************************* Register image ****************************/
 /* Copy the content of a register image into another. The size n is
    the size of the register image. Due to struct assignment generation of


--===============74437632960426026==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74437632960426026==--
