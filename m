From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Apr 2017 20:08:20 +0000
Subject: [PATCH 0/2] IB/usnic: Fine-tuning for two function implementations
Message-Id: <f0a030a8-2a03-f531-57d8-39c2aeae28a4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christian Benvenuti <benve-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Dave Goodell <dgoodell-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 6 Apr 2017 22:00:10 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use kcalloc() in alloc_res_chunk_list()
  Use kcalloc() in usnic_vnic_alloc_res_chunk()

 drivers/infiniband/hw/usnic/usnic_ib_qp_grp.c | 4 ++--
 drivers/infiniband/hw/usnic/usnic_vnic.c      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.12.2

