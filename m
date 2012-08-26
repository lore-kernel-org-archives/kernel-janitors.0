From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 26 Aug 2012 09:04:47 +0000
Subject: fs/ntfs/super.c:2717:1-14: alloc with no test
Message-Id: <20120826090447.GA11098@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anton Altaparmakov <anton@tuxera.com>
Cc: kernel-janitors@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org


Hi Anton,

FYI, coccinelle warns about

fs/ntfs/super.c:2717:1-14: alloc with no test, possible model on line 2718

vim +2717 fs/ntfs/super.c
  2714		sb->s_flags |= MS_RDONLY;
  2715	#endif /* ! NTFS_RW */
  2716		/* Allocate a new ntfs_volume and place it in sb->s_fs_info. */
> 2717		sb->s_fs_info = kmalloc(sizeof(ntfs_volume), GFP_NOFS);
  2718		vol = NTFS_SB(sb);
  2719		if (!vol) {
  2720			if (!silent)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
