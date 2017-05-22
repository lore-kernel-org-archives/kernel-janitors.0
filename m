From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 14:10:18 +0000
Subject: [PATCH 0/3] RDS: Adjustments for two function implementations
Message-Id: <44b46c51-3665-5f14-dd3b-6e6f230258a7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rds-devel-N0ozoZBvEnrZJqsBc5GL+g@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Sowmini Varadhan <sowmini.varadhan-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 16:02:03 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in rds_ib_add_one()
  Improve a size determination in rds_ib_add_one()
  Delete an error message for a failed memory allocation in rds_tcp_init_net()

 net/rds/ib.c  | 7 ++-----
 net/rds/tcp.c | 5 ++---
 2 files changed, 4 insertions(+), 8 deletions(-)

-- 
2.13.0

