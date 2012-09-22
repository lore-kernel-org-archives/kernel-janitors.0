From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 22 Sep 2012 00:48:04 +0000
Subject: [modsign:modsign-post-KS 25/26] make[2]: *** No rule to make target `signing_key.x509', needed by `k
Message-Id: <20120922004804.GK5959@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-modsign.git modsign-post-KS
head:   c563cc3b00d61b65762c9040689f4ddf416b0557
commit: 19ff7238a74b4c9403cd3819986202547c1af391 [25/26] MODSIGN: Provide module signing public keys to the kernel
config: x86_64-allyesconfig

All related error/warning messages:

make[2]: *** No rule to make target `signing_key.x509', needed by `kernel/modsign_pubkey.o'.
make[2]: Target `__build' not remade because of errors.

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
