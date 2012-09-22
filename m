From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sat, 22 Sep 2012 00:48:14 +0000
Subject: [modsign:modsign-post-KS 23/26] (.text+0x688cc): undefined reference to `pkey_hash_algo'
Message-Id: <20120922004814.GL5959@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-modsign.git modsign-post-KS
head:   2f07589773efc8830ddaa63db8c68adf924ffc1d
commit: d20161675cb62a9a34f63e2b2c035835992604b4 [23/26] MODSIGN: Provide Kconfig options
config: x86_64-allmodconfig

[error]
(.text+0x688cc): undefined reference to `pkey_hash_algo'
(.text+0x8521): undefined reference to `public_key_destroy'
(.text+0x8610): undefined reference to `asn1_ber_decoder'
(.text+0x869d): undefined reference to `look_up_OID'
(.text+0x86bf): undefined reference to `sprint_oid'
x509_public_key.c:(.text+0x8e53): undefined reference to `public_key_subtype'



---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
