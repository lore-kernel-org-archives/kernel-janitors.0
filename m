From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 10 Apr 2017 20:15:52 +0000
Subject: [PATCH 0/3] Thermal/int340x: Fine-tuning for five function implementations
Message-Id: <3ba36cc1-8445-462c-ca75-2b0928f3290a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pm@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 10 Apr 2017 22:08:11 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use kcalloc() in two functions
  Improve size determinations in two functions
  Use kcalloc() in int340x_thermal_zone_add()

 drivers/thermal/int340x_thermal/acpi_thermal_rel.c     | 8 ++++----
 drivers/thermal/int340x_thermal/int340x_thermal_zone.c | 7 ++++---
 2 files changed, 8 insertions(+), 7 deletions(-)

-- 
2.12.2

