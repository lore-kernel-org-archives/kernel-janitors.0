From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 17:39:20 +0000
Subject: [PATCH 0/2] IB/core: Fine-tuning for ib_is_udata_cleared()
Message-Id: <f7bb3caf-81cd-fba9-afc8-5fac72b8a4b3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Sean Hefty <sean.hefty@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 21 Aug 2016 19:34:12 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use memdup_user()
  Delete an unnecessary initialisation

 include/rdma/ib_verbs.h | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

-- 
2.9.3

