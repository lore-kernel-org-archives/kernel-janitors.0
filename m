From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 06:55:26 +0000
Subject: [PATCH 0/2] [media] Si2157: Adjustments for two function implementations
Message-Id: <87f4a386-ac11-87f5-2d22-7bfc0593de34@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 08:48:24 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination in two functions

 drivers/media/tuners/si2157.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.14.1

