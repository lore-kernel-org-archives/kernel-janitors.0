From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 09 Sep 2017 19:12:31 +0000
Subject: [PATCH 0/2] [media] xc4000: Adjustments for xc4000_fwupload()
Message-Id: <61016489-eb01-2977-b094-343aa70686b0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 9 Sep 2017 21:00:12 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete two error messages for a failed memory allocation
  Adjust two null pointer checks

 drivers/media/tuners/xc4000.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.14.1

