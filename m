From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Jun 2013 11:37:22 +0000
Subject: build regressions 2013-06-11
Message-Id: <51b85d72.ZaC/D/zTkmoel7yv%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[sparse]
fs/f2fs/super.c:120:6: sparse: symbol 'f2fs_dirty_inode' was not declared. Should it be static?

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
