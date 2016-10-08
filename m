From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 08 Oct 2016 11:46:28 +0000
Subject: [PATCH 0/2] [media] cx88-dsp: Fine-tuning for five function implementations
Message-Id: <ebf6d2f7-eb50-d55b-e782-689af9ecda31@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 8 Oct 2016 13:41:12 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use kmalloc_array()
  Add some spaces for better code readability

 drivers/media/pci/cx88/cx88-dsp.c | 43 +++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

-- 
2.10.1

