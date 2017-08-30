From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 20:20:13 +0000
Subject: [PATCH 0/4] [media] ds3000: Adjustments for two function implementations
Message-Id: <c854b845-3b79-ca7a-a597-4abc5f32ec54@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 22:11:33 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an error message for a failed memory allocation in two functions
  Improve a size determination in ds3000_attach()
  Delete an unnecessary variable initialisation in ds3000_attach()
  Delete jump targets in ds3000_attach()

 drivers/media/dvb-frontends/ds3000.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

-- 
2.14.1

