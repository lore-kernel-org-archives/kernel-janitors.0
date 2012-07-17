From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 17 Jul 2012 00:10:14 +0000
Subject: [dlm:next 1/6] fs/dlm/lock.c:1049:9: sparse: context imbalance in 'dlm_master_lookup' - different lo
Message-Id: <20120717001014.GC16944@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

I don't know enough to tell whether this if false alarm. Would you
help confirm it? Thank you.

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git next
head:   96006ea6d4eea73466e90ef353bf34e507724e77
commit: c04fecb4d9f7753e0cbff7edd03ec68f8721cdce [1/6] dlm: use rsbtbl as resource directory

One new sparse warning is triggered (and there were no old warnings before patch):

+ fs/dlm/lock.c:1049:9: sparse: context imbalance in 'dlm_master_lookup' - different lock contexts for basic block

vim +1049 fs/dlm/lock.c
  1046			unlock_rsb(r);
  1047			put_rsb(r);
  1048		}
> 1049		return 0;
  1050	
  1051	 not_found:
  1052		error = get_rsb_struct(ls, name, len, &r);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
