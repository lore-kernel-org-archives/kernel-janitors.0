From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 18:40:13 +0000
Subject: [PATCH 0/3] [media] cx18: Adjustments for seven function implementations
Message-Id: <016d4c9c-1d8e-e277-5d7c-f433553cf0fa@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Andy Walls <awalls@md.metrocast.net>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 20:03:45 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation
  Improve a size determination
  Adjust ten checks for null pointers

 drivers/media/pci/cx18/cx18-driver.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

-- 
2.14.1

