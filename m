From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 14 May 2013 17:16:02 +0000
Subject: build regressions 2013-05-14
Message-Id: <51927152.BbFk5ZBHlNRD/RZI%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
arch/x86/kvm/Makefile:12: *** commands commence before first target.  Stop.
(.text+0x12b82a): undefined reference to `iio_kfifo_allocate'
(.text+0x12b8ae): undefined reference to `iio_kfifo_free'
(.text+0x12b8d8): undefined reference to `iio_kfifo_free'
(.text+0x1047a): undefined reference to `crypto_shash_update'
(.text+0x104b6): undefined reference to `crypto_alloc_shash'
(.text+0x1052e): undefined reference to `crypto_destroy_tfm'
(.text+0x10540): undefined reference to `crypto_destroy_tfm'
crc-t10dif.c:(.exit.text+0x10): undefined reference to `crypto_destroy_tfm'
crct10dif.c:(.init.text+0x9): undefined reference to `crypto_register_shash'
crct10dif.c:(.exit.text+0x9): undefined reference to `crypto_unregister_shash'
af9035.c:(.text+0x1a0a01): undefined reference to `mxl5007t_attach'
az6007.c:(.text+0x1a1f0f): undefined reference to `drxk_attach'
rtl28xxu.c:(.text+0x1a5665): undefined reference to `fc0013_attach'
rtl28xxu.c:(.text+0x1a569f): undefined reference to `e4000_attach'
rtl28xxu.c:(.text+0x1a8af7): undefined reference to `r820t_attach'
amilo-rfkill.c:(.text+0x1a5748): undefined reference to `i8042_lock_chip'
amilo-rfkill.c:(.text+0x1a5756): undefined reference to `i8042_command'
amilo-rfkill.c:(.text+0x1a575d): undefined reference to `i8042_unlock_chip'

[warnings]
drivers/staging/wlags49_h2/wl_main.c:3174:122: warning: comparison of distinct pointer types lacks a cast [enabled by default]
drivers/staging/wlags49_h25/../wlags49_h2/wl_main.c:3174:122: warning: comparison of distinct pointer types lacks a cast [enabled by default]
warning: (CRC_T10DIF) selects CRYPTO_CRCT10DIF which has unmet direct dependencies (CRYPTO && CRC_T10DIF)
warning: (CRC_T10DIF) selects CRYPTO_CRCT10DIF which has unmet direct dependencies (CRYPTO && CRC_T10DIF)
warning: (CRC_T10DIF) selects CRYPTO_CRCT10DIF which has unmet direct dependencies (CRYPTO && CRC_T10DIF)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
