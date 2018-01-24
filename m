From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 17:38:13 +0000
Subject: [PATCH 0/2] Input-arc_ps2: Adjustments for two function implementations
Message-Id: <f3c837b2-7be1-11fe-ba2c-1792590125d2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 18:34:56 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in arc_ps2_probe()
  Improve a size determination in two functions

 drivers/input/serio/arc_ps2.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

-- 
2.16.1

