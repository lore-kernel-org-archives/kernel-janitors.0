From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 13:04:54 +0000
Subject: [PATCH 0/4] [media] ADV7...: Adjustments for four function implementations
Message-Id: <0e67e095-4931-b78f-a925-7335326ab69c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 14:49:43 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an error message for a failed memory allocation in adv76xx_probe()
  Adjust a null pointer check in three functions
  Delete an error message for a failed memory allocation in adv7842_probe()
  Improve a size determination in adv7842_probe()

 drivers/media/i2c/adv7604.c | 10 ++++------
 drivers/media/i2c/adv7842.c |  6 ++----
 2 files changed, 6 insertions(+), 10 deletions(-)

-- 
2.14.1

