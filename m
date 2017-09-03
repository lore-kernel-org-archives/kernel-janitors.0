From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Sep 2017 14:01:03 +0000
Subject: [PATCH 0/2] [media] Motion Eye: Adjustments for meye_probe()
Message-Id: <4370c644-e440-1268-089b-8a8686bbcd5c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Pan Bian <bianpan2016@163.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 3 Sep 2017 15:54:45 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete three error messages for a failed memory allocation
  Adjust two function calls together with a variable assignment

 drivers/media/pci/meye/meye.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

-- 
2.14.1

