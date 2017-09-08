From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 08 Sep 2017 12:29:04 +0000
Subject: [PATCH 0/3] [media] DaVinci-VPBE-Display: Adjustments for some function implementations
Message-Id: <e980c48c-9525-4942-a58e-20af8a96e531@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Prabhakar Lad <prabhakar.csengg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 8 Sep 2017 14:12:10 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in init_vpbe_layer()
  Improve a size determination in two functions
  Adjust 12 checks for null pointers

 drivers/media/platform/davinci/vpbe_display.c | 37 +++++++++++----------------
 1 file changed, 15 insertions(+), 22 deletions(-)

-- 
2.14.1

