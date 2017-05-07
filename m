From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 09:50:23 +0000
Subject: [PATCH 0/3] thermal-Tegra: Fine-tuning for regs_show()
Message-Id: <b0795133-ebb9-56b3-567d-b3773f298789@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Eduardo Valentin <edubezval@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Wei Ni <wni@nvidia.com>, Zhang Rui <rui.zhang@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 11:40:04 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Combine two function calls into one
  Use seq_putc() in regs_show()
  Combine two seq_printf() calls into one

 drivers/thermal/tegra/soctherm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

-- 
2.12.2

