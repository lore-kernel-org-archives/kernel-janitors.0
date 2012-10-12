From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 12 Oct 2012 18:23:03 +0000
Subject: [memcg:since-3.6 14/227] drivers/media/video/vino.c:3953:35: error: 'VM_RESERVED' undeclared
Message-Id: <20121012182303.GA24093@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Konstantin,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git since-3.6
head:   281983c5fb7e420ecf6c80074f7d4c2d3f330dd2
commit: aa011e456e6bd7e4179b03289d7501f8c8444809 [14/227] mm: kill vma flag VM_RESERVED and mm->reserved_vm counter
config: mips-allmodconfig # make ARCH=mips allmodconfig

All error/warnings:

drivers/media/video/vino.c: In function 'vino_mmap':
drivers/media/video/vino.c:3953:35: error: 'VM_RESERVED' undeclared (first use in this function)
drivers/media/video/vino.c:3953:35: note: each undeclared identifier is reported only once for each function it appears in

vim +3953 drivers/media/video/vino.c

d203a7ec Ralf Baechle 2005-09-06  3947  		start += PAGE_SIZE;
d203a7ec Ralf Baechle 2005-09-06  3948  		size -= PAGE_SIZE;
d203a7ec Ralf Baechle 2005-09-06  3949  	}
d203a7ec Ralf Baechle 2005-09-06  3950  
d203a7ec Ralf Baechle 2005-09-06  3951  	fb->map_count = 1;
d203a7ec Ralf Baechle 2005-09-06  3952  
d203a7ec Ralf Baechle 2005-09-06 @3953  	vma->vm_flags |= VM_DONTEXPAND | VM_RESERVED;
d203a7ec Ralf Baechle 2005-09-06  3954  	vma->vm_flags &= ~VM_IO;
d203a7ec Ralf Baechle 2005-09-06  3955  	vma->vm_private_data = fb;
d203a7ec Ralf Baechle 2005-09-06  3956  	vma->vm_file = file;

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
