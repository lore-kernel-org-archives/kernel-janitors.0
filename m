From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sun, 04 Jan 2004 03:26:13 +0000
Subject: Re: [Kernel-janitors] [PATCH] Check return code in
Message-Id: <20040104032613.GC20458@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132524.GA21909@eugeneteo.net>
In-Reply-To: <20040103132524.GA21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

<quote sender="Matthew Wilcox">
> On Sat, Jan 03, 2004 at 09:26:13PM +0800, Eugene Teo wrote:
> > http://www.anomalistic.org/patches/setup-check-ret-alloc_bootmem_low-fix-2.6.1-rc1-mm1.patch
> > 
> > diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/kernel/setup.c 2.6.1-rc1-mm1-fix/arch/i386/kernel/setup.c

[snip]

> I'd rather panic() at this point, otherwise we're going to start
> allocating areas twice and have some really unexplainable crashes.
> say something like ... panic("Insufficient memory to boot\n");

Hehe, I can't imagine how nasty it would be if we didn't panic :)

http://www.anomalistic.org/patches/setup-check-ret-alloc_bootmem_low-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/arch/i386/kernel/setup.c 2.6.1-rc1-mm1-fix/arch/i386/kernel/setup.c
--- 2.6.1-rc1-mm1/arch/i386/kernel/setup.c	2004-01-04 10:29:21.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/arch/i386/kernel/setup.c	2004-01-04 10:47:03.000000000 +0800
@@ -875,6 +875,8 @@
 		if (e820.map[i].addr + e820.map[i].size > 0x100000000ULL)
 			continue;
 		res = alloc_bootmem_low(sizeof(struct resource));
+		if (!res) 
+			panic("Insufficient memory to boot\n");
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
