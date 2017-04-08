From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 08 Apr 2017 12:10:10 +0000
Subject: [PATCH 0/3] InfiniBand-SRP: Fine-tuning for some function implementations
Message-Id: <50db1f1d-b689-1a9d-f6dd-a0f55169c75a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bart Van Assche <bart.vanassche-XdAiOPVOjttBDgjK7y7TUQ@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 8 Apr 2017 14:04:04 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use kmalloc_array() in srp_alloc_req_data()
  Enclose 14 expressions for the sizeof operator by parentheses
  Delete unwanted spaces behind usages of the sizeof operator

 drivers/infiniband/ulp/srp/ib_srp.c | 59 +++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

-- 
2.12.2

