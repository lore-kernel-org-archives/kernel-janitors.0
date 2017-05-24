From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 May 2017 18:02:36 +0000
Subject: [PATCH 0/2] Blackfin: Adjustments for two function implementations
Message-Id: <a8f92213-f0c5-8a4f-2b9e-60645f426210@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adi-buildroot-devel@lists.sourceforge.net, Ingo Molnar <mingo@kernel.org>, Steven Miao <realmz6@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 May 2017 20:00:02 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in bfin_pm_suspend_mem_enter()
  Delete an error message for a failed memory allocation in isram_test_init()

 arch/blackfin/mach-common/pm.c  | 4 +---
 arch/blackfin/mm/isram-driver.c | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

-- 
2.13.0

