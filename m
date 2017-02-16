From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Feb 2017 09:00:42 +0000
Subject: [PATCH 0/2] IB/hns: Fine-tuning for two function implementations
Message-Id: <4863af1d-ca80-1818-213e-7eadda35e8a1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Wei Hu <xavier.huwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 16 Feb 2017 09:55:43 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use kmalloc_array() in hns_roce_cmd_use_events()
  Use kcalloc() in hns_roce_buddy_init()

 drivers/infiniband/hw/hns/hns_roce_cmd.c |  6 +++---
 drivers/infiniband/hw/hns/hns_roce_mr.c  | 11 ++++++-----
 2 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.11.1

