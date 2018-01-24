From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 20:29:00 +0000
Subject: [PATCH 0/3] Input-bcm5974: Adjustments for two function implementations
Message-Id: <0505482c-287f-8809-76e3-960cf45b3c0a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Henrik Rydberg <rydberg@bitmath.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 21:25:24 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation
    in bcm5974_wellspring_mode()
  Return directly after a failed kmalloc() in bcm5974_wellspring_mode()
  Improve a size determination in bcm5974_probe()

 drivers/input/mouse/bcm5974.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

-- 
2.16.1

