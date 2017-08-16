From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 16:13:18 +0000
Subject: [PATCH 0/2] fs-qnx6: Adjustments for qnx6_mmi_fill_super()
Message-Id: <55b824fd-3f8a-4ca6-583f-27f584cd237a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabian Frederick <fabf@skynet.be>, Kai Bankett <chaosman@ontika.net>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 18:08:02 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Less checks in qnx6_mmi_fill_super() after error detection

 fs/qnx6/super_mmi.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

-- 
2.14.0

