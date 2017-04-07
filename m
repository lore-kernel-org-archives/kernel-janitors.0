From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 07 Apr 2017 20:54:24 +0000
Subject: [PATCH 0/9] InfiniBand-ULP: Fine-tuning for several function implementations
Message-Id: <ce4249f2-c7e7-0282-2cff-3f9c3991efa3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, target-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Ahern <dsa-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Erez Shitrit <erezsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Feras Daoud <ferasda-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leon-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Bloch <markb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Or Gerlitz <ogerlitz-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Paolo Abeni <pabeni-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Roi Dayan <roid-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Sagi Grimberg <sagi-NQWnxTmZq1alnMjI0IkVqw@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Yuval Shaia <yuval.shaia-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Zhu Yanjun <yanjun.zhu-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 7 Apr 2017 22:34:32 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (9):
  IPoIB: Use kcalloc() in two functions
  IPoIB: Delete an error message for a failed memory allocation
  IPoIB: Enclose six expressions for the sizeof operator by parentheses
  IPoIB: Delete unwanted spaces behind usages of the sizeof operator
  IPoIB: Combine substrings for three messages
  iser: Use kmalloc_array() in iser_alloc_rx_descriptors()
  iser: Add spaces for better code readability
  isert: Use kcalloc() in isert_alloc_rx_descriptors()
  isert: Improve size determinations in three functions

 drivers/infiniband/ulp/ipoib/ipoib_main.c    | 49 ++++++++++++++--------------
 drivers/infiniband/ulp/iser/iser_initiator.c | 11 ++++---
 drivers/infiniband/ulp/isert/ib_isert.c      | 11 ++++---
 3 files changed, 36 insertions(+), 35 deletions(-)

-- 
2.12.2

