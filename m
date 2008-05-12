From: "Pranith Kumar" <bobby.prani@gmail.com>
Date: Mon, 12 May 2008 09:34:26 +0000
Subject: [Patch 1/1] Trivial - 2.6.26-rc2, arch/x86/mm/pat.c - fix warning
Message-Id: <430c80e90805120222u45dac846j96c4a1810114b94d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: trivial@kernel.org, LKML <linux-kernel@vger.kernel.org>, Kernel List <kernelnewbies@nl.linux.org>, kernel-janitors@vger.kernel.org

Hello,

I get this warning when i compile the latest rc2
arch/x86/mm/pat.c: In function `phys_mem_access_prot_allowed':
arch/x86/mm/pat.c:558: warning: long long unsigned int format, long
unsigned int arg (arg 6)
arch/x86/mm/pat.c: In function `map_devmem':
arch/x86/mm/pat.c:580: warning: long long unsigned int format, long
unsigned int arg (arg 6)

The following patch fixes this warning

Signed-Off-by: D Pranith Kumar <bobby.prani@gmail.com>

--- linux-2.6.26-rc2/arch/x86/mm/pat.c.orig	2008-05-12 14:25:16.000000000 +0530
+++ linux-2.6.26-rc2/arch/x86/mm/pat.c	2008-05-12 14:24:05.000000000 +0530
@@ -555,7 +555,7 @@ int phys_mem_access_prot_allowed(struct
 		"%s:%d /dev/mem ioremap_change_attr failed %s for %Lx-%Lx\n",
 			current->comm, current->pid,
 			cattr_name(flags),
-			offset, offset + size);
+			offset, (unsigned long long)(offset + size));
 		return 0;
 	}

@@ -576,7 +576,7 @@ void map_devmem(unsigned long pfn, unsig
 		"%s:%d /dev/mem expected mapping type %s for %Lx-%Lx, got %s\n",
 			current->comm, current->pid,
 			cattr_name(want_flags),
-			addr, addr + size,
+			addr, (unsigned long long)(addr + size),
 			cattr_name(flags));
 	}
 }
