From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Jan 2018 20:26:13 +0000
Subject: [PATCH 0/3] Input-cyttsp4_core: Adjustments for some function implementations
Message-Id: <61183426-0b2a-4b93-933c-a2dfd487d92b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Ferruh Yigit <fery@cypress.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Jan 2018 21:23:45 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete two error messages for a failed memory allocation in cyttsp4_probe()
  Delete an unnecessary return statement in three functions
  Adjust 13 checks for null pointers

 drivers/input/touchscreen/cyttsp4_core.c | 33 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

-- 
2.16.0

