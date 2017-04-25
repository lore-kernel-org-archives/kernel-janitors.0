From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 12:43:25 +0000
Subject: [PATCH 0/2] HSI: Fine-tuning for three function implementations
Message-Id: <52f7db50-a3a0-6bc5-a39f-1d235a5945cd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>, Carlos Chinea <carlos.chinea@nokia.com>, Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sre@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 14:32:10 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use kcalloc() in hsi_register_board_info()
  core: Use kcalloc() in two functions

 drivers/hsi/hsi_boardinfo.c | 2 +-
 drivers/hsi/hsi_core.c      | 7 +++----
 2 files changed, 4 insertions(+), 5 deletions(-)

-- 
2.12.2

