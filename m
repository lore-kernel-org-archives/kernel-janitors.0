From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sat, 03 Jan 2004 13:26:13 +0000
Subject: [Kernel-janitors] [PATCH] Check return code in
Message-Id: <20040103132613.GB21909@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132524.GA21909@eugeneteo.net>
In-Reply-To: <20040103132524.GA21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

http://www.anomalistic.org/patches/setup-check-ret-alloc_bootmem_low-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/kernel/setup.c 2.6.1-rc1-mm1-fix/arch/i386/kernel/setup.c
--- 2.6.1-rc1-mm1/arch/i386/kernel/setup.c	2004-01-03 20:33:38.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/arch/i386/kernel/setup.c	2004-01-03 20:58:40.000000000 +0800
@@ -17,6 +17,8 @@
  *  Provisions for empty E820 memory regions (reported by certain BIOSes).
  *  Alex Achenbach <xela@slit.de>, December 2002.
  *
+ *  Check the return value of alloc_bootmem_low.
+ *  Eugene Teo <eugeneteo@eugeneteo.net>, January 2004.
  */
 
 /*
@@ -875,6 +877,10 @@
 		if (e820.map[i].addr + e820.map[i].size > 0x100000000ULL)
 			continue;
 		res = alloc_bootmem_low(sizeof(struct resource));
+		if (!res) {
+			printk(KERN_ERR "Cannot allocate lowmem\n");
+			return;
+		}
 		switch (e820.map[i].type) {
 		case E820_RAM:	res->name = "System RAM"; break;
 		case E820_ACPI:	res->name = "ACPI Tables"; break;

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
