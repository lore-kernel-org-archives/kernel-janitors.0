From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 22 Sep 2012 00:31:46 +0000
Subject: [xen:linux-next-pvh 16/17] drivers/xen/privcmd.c:296:3: error: implicit declaration of function 'pvh
Message-Id: <20120922003146.GE5959@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Mukesh,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git linux-next-pvh
head:   4bbc734b89e508f2287c1e6a0ac857f471fb3dc8
commit: c36251726a6d29514161bceaf87a067c177c3aa2 [16/17] PVH privcmd changes
config: x86_64-allmodconfig

All related error/warning messages:

drivers/xen/privcmd.c: In function 'mmap_batch_fn':
drivers/xen/privcmd.c:296:3: error: implicit declaration of function 'pvh_privcmd_resv_pfns' [-Werror=implicit-function-declaration]
drivers/xen/privcmd.c:296:41: error: 'm' undeclared (first use in this function)
drivers/xen/privcmd.c:296:41: note: each undeclared identifier is reported only once for each function it appears in
drivers/xen/privcmd.c:297:14: error: 'mm' undeclared (first use in this function)
drivers/xen/privcmd.c: At top level:
drivers/xen/privcmd.c:324:12: error: static declaration of 'pvh_privcmd_resv_pfns' follows non-static declaration
drivers/xen/privcmd.c:296:14: note: previous implicit declaration of 'pvh_privcmd_resv_pfns' was here
drivers/xen/privcmd.c:515:24: error: expected '}' before ';' token
drivers/xen/privcmd.c:324:12: warning: 'pvh_privcmd_resv_pfns' defined but not used [-Wunused-function]
drivers/xen/privcmd.c:505:12: warning: 'privcmd_fault' defined but not used [-Wunused-function]
cc1: some warnings being treated as errors

vim +296 drivers/xen/privcmd.c
   290				if (st->global_error = 0)
   291					st->global_error = 1;
   292			}
   293		}
   294		st->va += PAGE_SIZE;
   295		if (xen_pv_domain() && xen_feature(XENFEAT_auto_translated_physmap)) {
 > 296			if ((ret = pvh_privcmd_resv_pfns(vma, m.num))) {
   297				up_write(&mm->mmap_sem);
   298			}
   299		}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
