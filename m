From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 19 Sep 2017 18:44:24 +0000
Subject: [PATCH 0/3] [media] HD PVR USB: Adjustments for two function implementations
Message-Id: <82d14066-5816-111c-9d21-f6a439e559c1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, Jonathan Sims <jonathan.625266@earthlink.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 19 Sep 2017 20:21:23 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete three error messages for a failed memory allocation
  Improve a size determination in hdpvr_alloc_buffers()
  Return an error code only as a constant in hdpvr_alloc_buffers()

 drivers/media/usb/hdpvr/hdpvr-core.c  |  8 ++------
 drivers/media/usb/hdpvr/hdpvr-video.c | 11 ++++-------
 2 files changed, 6 insertions(+), 13 deletions(-)

-- 
2.14.1

