From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 22 Sep 2012 00:31:27 +0000
Subject: [xen:linux-next-pvh 11/17] drivers/xen/privcmd.c:181:6: error: too few arguments to function 'xen_re
Message-Id: <20120922003127.GD5959@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Mukesh,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git linux-next-pvh
head:   4bbc734b89e508f2287c1e6a0ac857f471fb3dc8
commit: 82efc1ad38b7f4c8769f6c12e5d1cf730e83c2f9 [11/17] PVH mmu changes
config: x86_64-allmodconfig

All related error/warning messages:

drivers/xen/privcmd.c: In function 'mmap_mfn_range':
drivers/xen/privcmd.c:181:6: error: too few arguments to function 'xen_remap_domain_mfn_range'
In file included from drivers/xen/privcmd.c:35:0:
include/xen/xen-ops.h:28:5: note: declared here
drivers/xen/privcmd.c: In function 'mmap_batch_fn':
drivers/xen/privcmd.c:270:7: error: too few arguments to function 'xen_remap_domain_mfn_range'
In file included from drivers/xen/privcmd.c:35:0:
include/xen/xen-ops.h:28:5: note: declared here

vim +181 drivers/xen/privcmd.c
   175			return -EINVAL;
   176	
   177		rc = xen_remap_domain_mfn_range(vma,
   178						msg->va & PAGE_MASK,
   179						msg->mfn, msg->npages,
   180						vma->vm_page_prot,
 > 181						st->domain);
   182		if (rc < 0)
   183			return rc;
   184	

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
