From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 06 Dec 2012 16:53:33 +0000
Subject: build regressions 2012-12-06
Message-Id: <50c0cd8d./OH4IrIGio9zisVC%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drbd_actlog.c:(.text+0x72a68): undefined reference to `crc32c'
ERROR: "min_low_pfn" [drivers/block/aoe/aoe.ko] undefined!
ERROR: "max_low_pfn" [drivers/block/aoe/aoe.ko] undefined!

[warnings]
drivers/spi/spi.c:1554:23: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/vhost/blk.c:686:3: warning: passing argument 3 of 'vhost_dev_ioctl' makes pointer from integer without a cast [enabled by default]
net/core/neighbour.c:65:12: warning: 'zero' defined but not used [-Wunused-variable]
net/core/neighbour.c:66:12: warning: 'unres_qlen_max' defined but not used [-Wunused-variable]

[smatch]
drivers/char/tpm/tpm_stm_st33_i2c.c:748 tpm_st33_i2c_probe() warn: variable dereferenced before check 'platform_data' (see line 659)
drivers/char/tpm/tpm_stm_st33_i2c.c:848 tpm_st33_i2c_pm_resume() warn: should this be a bitwise op?

[coccinelle]
drivers/char/tpm/tpm_stm_st33_i2c.c:640:20-23: ERROR: client is NULL but dereferenced.
drivers/char/tpm/tpm_i2c_stm_st33.c:660:20-23: ERROR: client is NULL but dereferenced.

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
