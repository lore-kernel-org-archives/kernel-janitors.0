From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jan 2018 19:34:29 +0000
Subject: [PATCH 0/2] Input-da9063_onkey: Adjustments for da9063_onkey_probe()
Message-Id: <9b0e8f6a-6386-d307-34fc-7936c52bd0c6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, support.opensource@diasemi.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Steve Twiss <stwiss.opensource@diasemi.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Jan 2018 20:30:40 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/input/misc/da9063_onkey.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

-- 
2.16.1

