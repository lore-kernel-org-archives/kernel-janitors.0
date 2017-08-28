From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Aug 2017 11:13:21 +0000
Subject: [PATCH 0/3] [media] Siano: Adjustments for some function implementations
Message-Id: <386b5a60-548e-1896-5271-4875fa2aea94@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Aug 2017 12:55:43 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in three functions
  Improve a size determination in six functions
  Adjust five checks for null pointers

 drivers/media/common/siano/smscoreapi.c | 39 ++++++++++++++-------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

-- 
2.14.1

