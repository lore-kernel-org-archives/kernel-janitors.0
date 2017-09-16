From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 18:30:46 +0000
Subject: [PATCH 0/2] [media] IT913X: Adjustments for two function implementations
Message-Id: <0ad553a6-9aca-d20b-48df-4084d80e2223@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 20:12:34 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete two error messages for a failed memory allocation
  Improve three size determinations

 drivers/media/tuners/it913x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.14.1

