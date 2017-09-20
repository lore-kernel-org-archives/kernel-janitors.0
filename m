From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Sep 2017 06:33:26 +0000
Subject: [PATCH 0/3] [media] pvrusb2-ioread: Fine-tuning for eight function implementations
Message-Id: <c8117427-6d4d-0a1c-96c7-56e25d838b3e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Mike Isely <isely@pobox.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Sep 2017 08:28:48 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use common error handling code in pvr2_ioread_get_buffer()
  Delete an unnecessary check before kfree() in two functions
  Delete unnecessary braces in six functions

 drivers/media/usb/pvrusb2/pvrusb2-ioread.c | 60 +++++++++++++-----------------
 1 file changed, 25 insertions(+), 35 deletions(-)

-- 
2.14.1

