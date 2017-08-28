From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Aug 2017 10:08:49 +0000
Subject: [PATCH 0/2] [media] Cypress: Adjustments for cypress_load_firmware()
Message-Id: <f95552e6-edf1-ceed-0c16-c8d23b8309ea@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Aug 2017 12:00:21 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/media/common/cypress_firmware.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.14.1

