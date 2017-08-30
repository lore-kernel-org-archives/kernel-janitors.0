From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 19:14:29 +0000
Subject: [PATCH 0/2] [media] DRXD: Adjustments for three function implementations
Message-Id: <62e6221c-226c-3b25-08bb-4baff9b23cbb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 30 Aug 2017 21:10:12 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in load_firmware()
  Adjust a null pointer check in three functions

 drivers/media/dvb-frontends/drxd_hard.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.14.1

