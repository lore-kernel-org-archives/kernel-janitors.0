From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 13:30:12 +0000
Subject: [PATCH 0/4] [media] CPia2: Fine-tuning for four function implementations
Message-Id: <c2ff478e-94d7-6c92-f467-69f5b66b8a1e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Arvind Yadav <arvind.yadav.cs@gmail.com>, Hans Verkuil <hans.verkuil@cisco.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Shyam Saini <mayhs11saini@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 15:25:35 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Use common error handling code in cpia2_usb_probe()
  Adjust two function calls together with a variable assignment
  Delete unnecessary null pointer checks in free_sbufs()
  Delete an unnecessary return statement in process_frame()

 drivers/media/usb/cpia2/cpia2_usb.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

-- 
2.14.1

