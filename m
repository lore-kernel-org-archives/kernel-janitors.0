From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 08:40:10 +0000
Subject: [PATCH 0/3] HSI: nokia-modem: Fine-tuning for two function implementations
Message-Id: <be1a9b8a-bc9f-d96e-04b4-a6edf2dc37c6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 10:36:54 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use devm_kcalloc() in nokia_modem_gpio_probe()
  Delete error messages for a failed memory allocation in two functions
  Add a space character for better code readability in nokia_modem_probe()

 drivers/hsi/clients/nokia-modem.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

-- 
2.12.2

