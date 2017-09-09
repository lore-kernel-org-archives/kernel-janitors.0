From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 09 Sep 2017 20:30:15 +0000
Subject: [PATCH 0/3] [media] xc2028: Adjustments for two function implementations
Message-Id: <c2317603-f640-b0a6-ab86-7fda8040b6ba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 9 Sep 2017 22:18:22 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete two error messages for a failed memory allocation
  Adjust two null pointer checks
  Use common error handling code in load_firmware()

 drivers/media/tuners/tuner-xc2028.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

-- 
2.14.1

