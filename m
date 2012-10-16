From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 16 Oct 2012 03:30:38 +0000
Subject: [stericsson:very-early-printk 1/1] (.text+0x8282): undefined reference to `printascii'
Message-Id: <20121016033038.GA18883@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Linus,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git very-early-printk
head:   fe365f8d14989c7679a97a88a6aac7fd48ed744d
commit: fe365f8d14989c7679a97a88a6aac7fd48ed744d [1/1] very early printk
config: x86_64-allmodconfig # make ARCH=x86_64 allmodconfig

All error/warnings:

kernel/built-in.o: In function `vprintk_emit':
(.text+0x8282): undefined reference to `printascii'

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
