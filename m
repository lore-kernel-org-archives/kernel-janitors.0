From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Oct 2012 01:44:16 +0000
Subject: usr/include/linux/kvm_para.h:26: included file 'asm-m68k/kvm_para.h' is not exported
Message-Id: <20121003014416.GA10769@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Geert,

FYI, something goes wrong since

commit: 2bbc89a8e9c652ee71c6c3b2e0679b7ecedb1a09  m68k: Use Kbuild logic to import asm-generic headers
config: m68k-allmodconfig

All error/warnings:

usr/include/linux/kexec.h:49: userspace cannot reference function or variable defined in the kernel
usr/include/linux/kvm_para.h:26: included file 'asm-m68k/kvm_para.h' is not exported
usr/include/linux/soundcard.h:1054: userspace cannot reference function or variable defined in the kernel

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
