From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 23 May 2005 10:50:31 +0000
Subject: [KJ] [PATCH] printk : arch/i386/mm/ioremap.c
Message-Id: <20050523105031.GG13768@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="bCsyhTFzCvuiizWE"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc4_arch_i386_mm_ioremap.c.patch"

diff -urpNX dontdiff a/arch/i386/mm/ioremap.c b/arch/i386/mm/ioremap.c
--- a/arch/i386/mm/ioremap.c	2005-05-07 07:20:31.000000000 +0200
+++ b/arch/i386/mm/ioremap.c	2005-05-23 12:41:56.733580832 +0200
@@ -240,7 +240,7 @@ void iounmap(volatile void __iomem *addr
 
 	p = remove_vm_area((void *) (PAGE_MASK & (unsigned long __force) addr));
 	if (!p) { 
-		printk("__iounmap: bad address %p\n", addr);
+		printk(KERN_WARNING "__iounmap: bad address %p\n", addr);
 		return;
 	}
 

--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--bCsyhTFzCvuiizWE--
