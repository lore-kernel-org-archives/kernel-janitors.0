From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Aug 2017 05:30:52 +0000
Subject: [PATCH 0/4] [media] zr364xx: Adjustments for some function implementations
Message-Id: <d632eadf-98a3-7e05-4d9d-96d04b3619ff@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, linux-usb@vger.kernel.org, Antoine Jacquet <royale@zerezo.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Aug 2017 07:17:07 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an error message for a failed memory allocation in two functions
  Improve a size determination in zr364xx_probe()
  Adjust ten checks for null pointers
  Fix a typo in a comment line of the file header

 drivers/media/usb/zr364xx/zr364xx.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

-- 
2.14.1

