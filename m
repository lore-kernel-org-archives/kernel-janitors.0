From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 21:20:32 +0000
Subject: [PATCH 0/2] Input: wm831x-on: Adjustments for wm831x_on_probe()
Message-Id: <e307cfde-58e2-3f4d-ecd7-5c80ace0bb5b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, patches@opensource.cirrus.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 22:15:43 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/input/misc/wm831x-on.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

-- 
2.16.1

