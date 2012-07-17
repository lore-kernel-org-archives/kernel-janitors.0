From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 17 Jul 2012 17:42:17 +0000
Subject: [modsign:modsign 23/27] kernel/module-verify.c:63:15: warning: unused variable 'secsize'
Message-Id: <20120717174217.GA5545@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

There are new compile warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-modsign.git modsign
head:   88883f815418ff31af0e71ece672656ef75a5e88
commit: 0e3a9d4eb0e62a7133409aaf371f82dedf57bc9e [23/27] MODSIGN: Check the ELF container

All warnings:

kernel/module-verify.c: In function 'module_verify_elf':
kernel/module-verify.c:63:15: warning: unused variable 'secsize' [-Wunused-variable]

vim +63 kernel/module-verify.c
    60		const Elf_Shdr *section, *secstop;
    61		const Elf_Sym *symbols, *symbol, *symstop;
    62		const char *strtab;
  > 63		size_t size, secsize, secstrsize, strsize, notesize, notemetasize;
    64		unsigned line;
    65	
    66		size = mvdata->size;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
