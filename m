From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 27 Dec 2015 12:36:30 +0000
Subject: [PATCH 0/2] InfiniBand-iSER: Refactoring for two function implementations
Message-Id: <567FDB4E.2040000@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, target-devel@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Or Gerlitz <ogerlitz@mellanox.com>, Roi Dayan <roid@mellanox.com>, Sagi Grimberg <sagig@mellanox.com>, Sean Hefty <sean.hefty@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 27 Dec 2015 13:12:10 +0100
Subject: [PATCH 0/2] InfiniBand-iSER: Refactoring for two function implementations

I suggest to return directly instead of using the jump label "err"
in two functions (which are working without clean-up there).

Markus Elfring (2):
  One jump label less in iser_reg_sig_mr()
  One jump label less in isert_reg_sig_mr()

 drivers/infiniband/ulp/iser/iser_memory.c | 5 ++---
 drivers/infiniband/ulp/isert/ib_isert.c   | 7 +++----
 2 files changed, 5 insertions(+), 7 deletions(-)

-- 
2.6.3

