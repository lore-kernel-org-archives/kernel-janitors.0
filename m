From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 09 May 2013 23:18:38 +0000
Subject: build regressions 2013-05-09
Message-Id: <518c2ece.PgBlA/YeXghg03yb%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
kernel/mutex.c:837:3: error: 'tmp' undeclared (first use in this function)
gdm_usb.c:(.text+0x1b9da4): undefined reference to `usb_unlink_urb'
gdm_usb.c:(.text+0x1b9fac): undefined reference to `usb_unlink_urb'
crypto/built-in.o:(.rodata+0x1a0dc): undefined reference to `RSA_public_key_algorithm'
saa7134-dvb.c:(.text+0xe0573): undefined reference to `s5h1411_attach'
(.text+0x216d0e): undefined reference to `acpi_video_get_edid'
file.c:(.text+0x17b3d0): undefined reference to `dlm_posix_get'
file.c:(.text+0x17b3f2): undefined reference to `dlm_posix_unlock'
file.c:(.text+0x17b40a): undefined reference to `dlm_posix_lock'
lock_dlm.c:(.text+0x1921c4): undefined reference to `dlm_unlock'
lock_dlm.c:(.text+0x19250e): undefined reference to `dlm_release_lockspace'
lock_dlm.c:(.text+0x1926dc): undefined reference to `dlm_unlock'
lock_dlm.c:(.text+0x192839): undefined reference to `dlm_lock'
lock_dlm.c:(.text+0x1932c6): undefined reference to `dlm_unlock'
lock_dlm.c:(.text+0x19351e): undefined reference to `dlm_lock'
lock_dlm.c:(.text+0x193fde): undefined reference to `dlm_new_lockspace'
lock_dlm.c:(.text+0x194124): undefined reference to `dlm_release_lockspace'
(.text+0x4e1eab): undefined reference to `snd_card_create'
(.text+0x4e1f57): undefined reference to `snd_ac97_bus'
(.text+0x4e1f77): undefined reference to `snd_card_free'
(.text+0x4e1fcb): undefined reference to `snd_ac97_mixer'
(.text+0x4e1fe2): undefined reference to `snd_card_register'
(.text+0x4e2023): undefined reference to `snd_card_free'
tuner-core.c:(.text+0x5518b7): undefined reference to `xc2028_attach'
tuner-core.c:(.text+0x551908): undefined reference to `tea5761_attach'
tuner-core.c:(.text+0x551976): undefined reference to `xc4000_attach'
tuner-core.c:(.text+0x551d64): undefined reference to `tea5761_autodetection'
tuner-core.c:(.text+0x56d3a3): undefined reference to `xc5000_attach'

[warnings]
drivers/net/usb/r8152.c:956: warning: integer overflow in expression
drivers/md/bcache/debug.c:95:7: warning: '<U26e0>.high' may be used uninitialized in this function [-Wuninitialized]

[coccinelle]
drivers/scsi/ufs/ufshcd.c:723:15-18: ERROR: hba is NULL but dereferenced.
drivers/scsi/ufs/ufshcd.c:723:15-18: ERROR: hba is NULL but dereferenced.
drivers/scsi/pm8001/pm8001_hwi.c:3749:5-14: ERROR: t is NULL but dereferenced.
drivers/scsi/pm8001/pm8001_hwi.c:3749:5-14: ERROR: t is NULL but dereferenced.

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
