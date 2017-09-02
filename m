From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 15:47:28 +0000
Subject: [PATCH 0/7] [media] OmniVision: Adjustments for four function implementations
Message-Id: <c9f2ba21-c742-e1e8-26d9-a56c51c56d65@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, =?UTF-8?Q?Frank_Sch=c3=a4fer?= <fschaefer.oss@googlemail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Hans Verkuil <hans.verkuil@cisco.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 17:01:23 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (7):
  Delete an error message for a failed memory allocation in ov2640_probe()
  Improve a size determination in ov2640_probe()
  Delete an error message for a failed memory allocation in ov6650_probe()
  Delete an error message for a failed memory allocation in ov9640_probe()
  Improve a size determination in ov9640_probe()
  Delete an error message for a failed memory allocation in ov9740_probe()
  Improve a size determination in ov9740_probe()

 drivers/media/i2c/ov2640.c            | 7 ++-----
 drivers/media/i2c/ov6650.c            | 5 +----
 drivers/media/i2c/soc_camera/ov9640.c | 7 ++-----
 drivers/media/i2c/soc_camera/ov9740.c | 6 ++----
 4 files changed, 7 insertions(+), 18 deletions(-)

-- 
2.14.1

