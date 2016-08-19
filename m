From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Aug 2016 09:17:32 +0000
Subject: [PATCH 0/2] uvc_v4l2: Fine-tuning for uvc_ioctl_ctrl_map()
Message-Id: <95aa5fcd-8610-debc-70b0-30b2ed3302d2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Aug 2016 11:11:01 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use memdup_user() rather than duplicating its implementation
  One function call less after error detection

 drivers/media/usb/uvc/uvc_v4l2.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

-- 
2.9.3

