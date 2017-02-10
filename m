From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Feb 2017 21:00:09 +0000
Subject: [PATCH 0/5] IB/hfi1: Fine-tuning for three function implementations
Message-Id: <8a997282-09c7-0f9f-645e-d7c6e8c79e67@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dennis Dalessandro <dennis.dalessandro-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Marciniszyn <mike.marciniszyn-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 10 Feb 2017 21:53:21 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kcalloc() in hfi1_user_exp_rcv_init()
  Use kcalloc() in hfi1_user_sdma_alloc_queues()
  Adjust another size determination in hfi1_user_sdma_alloc_queues()
  Use memdup_user() rather than duplicating its implementation in hfi1_user_sdma_process_request()
  Improve another size determination in hfi1_user_sdma_process_request()

 drivers/infiniband/hw/hfi1/user_exp_rcv.c |  5 +++--
 drivers/infiniband/hw/hfi1/user_sdma.c    | 35 +++++++++++++++----------------
 2 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.11.1

