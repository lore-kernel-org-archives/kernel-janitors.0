From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 20:38:37 +0000
Subject: [PATCH 0/7] AGPGART: Fine-tuning for four function implementations
Message-Id: <5204ca92-2cdf-8115-567c-4ac29816fcec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 22:34:56 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (7):
  Use kmalloc_array() in compat_agpioc_reserve_wrap()
  Use memdup_user() rather than duplicating its implementation
  Rename jump labels in compat_agp_ioctl()
  Use kmalloc_array() in agp_sgi_init()
  Use kmalloc_array() in uninorth_create_gatt_table()
  Rename a jump label in uninorth_create_gatt_table()
  Delete an unnecessary check in uninorth_create_gatt_table()

 drivers/char/agp/compat_ioctl.c | 31 +++++++++++++------------------
 drivers/char/agp/sgi-agp.c      |  6 +++---
 drivers/char/agp/uninorth-agp.c | 12 ++++++------
 3 files changed, 22 insertions(+), 27 deletions(-)

-- 
2.10.0

