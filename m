From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 11:12:42 +0000
Subject: [PATCH 0/3] HSI: omap_ssi: Fine-tuning for two function implementations
Message-Id: <2fa2c33a-dc43-7e03-03d7-7ca04931e6c7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 12:52:10 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use devm_kcalloc() in ssi_add_controller()
  Fix a typo in a comment line
  Delete an error message for a failed memory allocation in ssi_add_controller()

 drivers/hsi/controllers/omap_ssi_core.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.12.2

