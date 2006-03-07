From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 07 Mar 2006 12:12:48 +0000
Subject: [KJ] [Patch] kzalloc() conversion in arch/alpha
Message-Id: <1141733568.8665.4.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45496633038539835=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1141499387.30193.18.camel@alice>
In-Reply-To: <1141499387.30193.18.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============45496633038539835==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch converts arch/ppc to kzalloc usage.
Crosscompile tested with allyesconfig.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc5-mm1/arch/alpha/kernel/module.c.orig	2006-03-07 12:29:21.000000000 +0100
+++ linux-2.6.16-rc5-mm1/arch/alpha/kernel/module.c	2006-03-07 12:29:45.000000000 +0100
@@ -119,8 +119,7 @@ module_frob_arch_sections(Elf64_Ehdr *hd
 	}
 
 	nsyms = symtab->sh_size / sizeof(Elf64_Sym);
-	chains = kmalloc(nsyms * sizeof(struct got_entry), GFP_KERNEL);
-	memset(chains, 0, nsyms * sizeof(struct got_entry));
+	chains = kcalloc(nsyms, sizeof(struct got_entry), GFP_KERNEL);
 
 	got->sh_size = 0;
 	got->sh_addralign = 8;



--===============45496633038539835==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45496633038539835==--
