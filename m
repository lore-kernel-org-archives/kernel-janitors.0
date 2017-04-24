From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 12:38:29 +0000
Subject: [PATCH 0/3] Extcon: Fine-tuning for three functions
Message-Id: <b650292b-4f5f-c50d-f0a3-604ba26bcbef@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: patches@opensource.wolfsonmicro.com, Chanwoo Choi <cw00.choi@samsung.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 14:26:54 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use devm_kcalloc() in extcon_dev_register()
  Fix a typo in three comment lines
  Use devm_kcalloc() in arizona_extcon_get_micd_configs()

 drivers/extcon/extcon-arizona.c |  4 +---
 drivers/extcon/extcon.c         | 11 +++++------
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.12.2

