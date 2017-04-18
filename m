From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 20:00:37 +0000
Subject: [PATCH 0/3] SATA: Fine-tuning for two function implementations
Message-Id: <df754c7a-2100-7169-0d40-b981ccd952a1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-ide@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Tejun Heo <tj@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 21:54:32 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use kcalloc() in ahci_platform_get_resources()
  Use devm_kcalloc() in ahci_platform_get_resources()
  Use devm_kcalloc() in mv_platform_probe()

 drivers/ata/libahci_platform.c | 11 ++++++-----
 drivers/ata/sata_mv.c          | 10 ++++++----
 2 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.12.2

