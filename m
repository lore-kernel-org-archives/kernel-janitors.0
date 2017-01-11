From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 20:34:13 +0000
Subject: [PATCH 00/18] MTD-CFI: Fine-tuning for several function implementations
Message-Id: <71189baa-8780-b80a-0b4d-9dae74763ba3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, David Woodhouse <dwmw2@infradead.org>, Denys Vlasenko <dvlasenk@redhat.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Jan 2017 21:21:12 +0100

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (18):
  Use kmalloc_array() in cfi_intelext_partition_fixup()
  Improve another size determination in cfi_intelext_partition_fixup()
  cfi_cmdset_0001: Add some spaces for better code readability
  cfi_cmdset_0001: Delete an unnecessary variable initialisation in do_write_oneword()
  cfi_cmdset_0001: Use common error handling code in do_write_oneword()
  Use kcalloc() in cfi_intelext_setup()
  One function call and an unnecessary check less in cfi_intelext_setup()
  Rename a jump label in cfi_intelext_setup()
  Use kmalloc_array() in cfi_amdstd_setup()
  One function call less in cfi_amdstd_setup() after error detection
  Rename a jump label in cfi_amdstd_setup()
  cfi_cmdset_0002: Add some spaces for better code readability
  cfi_cmdset_0002: Delete an unnecessary variable initialisation in do_write_oneword()
  cfi_cmdset_0002: Use common error handling code in do_write_oneword()
  Use kcalloc() in cfi_ppb_unlock()
  Use kmalloc_array() in cfi_staa_setup()
  Use common error handling code in cfi_staa_setup()
  cfi_cmdset_0020: Add some spaces for better code readability

 drivers/mtd/chips/cfi_cmdset_0001.c | 165 +++++++++++++++++++-----------------
 drivers/mtd/chips/cfi_cmdset_0002.c | 110 +++++++++++++-----------
 drivers/mtd/chips/cfi_cmdset_0020.c | 127 ++++++++++++++-------------
 3 files changed, 214 insertions(+), 188 deletions(-)

-- 
2.11.0

