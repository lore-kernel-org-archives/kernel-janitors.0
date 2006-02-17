From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 17 Feb 2006 11:09:48 +0000
Subject: [KJ][Patch] Make storage class first in machine_kexec.c
Message-Id: <1140174588.7789.20.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20849663458792134=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140174003.7789.14.camel@localhost.localdomain>
In-Reply-To: <1140174003.7789.14.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============20849663458792134==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list,

from http://linuxicc.sourceforge.net/

ICC complains about :Storage Class is not First

@ line 136 & 138 of machine_kexec.c

The patch below just alters the order of the modifiers to make extern
first.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc3/arch/i386/kernel/machine_kexec.c.orig	2006-02-17 22:02:14.000000000 +1100
+++ linux-2.6.16-rc3/arch/i386/kernel/machine_kexec.c	2006-02-17 22:07:00.000000000 +1100
@@ -133,9 +133,9 @@ typedef asmlinkage NORET_TYPE void (*rel
 					unsigned long start_address,
 					unsigned int has_pae) ATTRIB_NORET;
 
-const extern unsigned char relocate_new_kernel[];
+extern const unsigned char relocate_new_kernel[];
 extern void relocate_new_kernel_end(void);
-const extern unsigned int relocate_new_kernel_size;
+extern const unsigned int relocate_new_kernel_size;
 
 /*
  * A architecture hook called to validate the



--===============20849663458792134==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20849663458792134==--
