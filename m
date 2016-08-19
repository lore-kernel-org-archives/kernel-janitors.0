From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Aug 2016 18:27:07 +0000
Subject: [PATCH 0/2] misc/mic/vop: Fine-tuning for vop_ioctl()
Message-Id: <f0ce0834-43e4-0535-9ae0-b18d3d18b0e0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Aug 2016 20:20:02 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use memdup_user()
  Rename jump labels

 drivers/misc/mic/vop/vop_vringh.c | 43 ++++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 26 deletions(-)

-- 
2.9.3

