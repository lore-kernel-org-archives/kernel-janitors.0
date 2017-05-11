From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 16:14:25 +0000
Subject: [PATCH 0/4] VMBus: Adjustments for some function implementations
Message-Id: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@linuxdriverproject.org, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 18:00:18 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Improve a size determination in vmbus_device_create()
  Delete an error message for a failed memory allocation in vmbus_device_create()
  Fix a typo in a comment line
  Adjust five checks for null pointers

 drivers/hv/vmbus_drv.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

-- 
2.12.3

