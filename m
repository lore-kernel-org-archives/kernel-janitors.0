From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Jan 2018 20:58:05 +0000
Subject: [PATCH 0/2] Input: tps6507x-ts: Adjustments for tps6507x_ts_probe()
Message-Id: <1ee278a0-a855-cfb3-fd04-24034ec42a65@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Yegor Yefremov <yegorslists@googlemail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Jan 2018 21:53:21 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/input/touchscreen/tps6507x-ts.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.15.1

