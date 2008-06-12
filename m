From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Thu, 12 Jun 2008 21:12:56 +0000
Subject: [PATCH] taskstats: remove initialization of static per-cpu variable
Message-Id: <20080612211256.GD3283@damson.getinternet.no>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Andrew,

The e-mail address of the maintainer (as listed in MAINTAINERS) gave me an
error, so it goes to you instead.

Thanks.


Vegard


From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Thu, 12 Jun 2008 22:08:45 +0200
Subject: [PATCH] taskstats: remove initialization of static per-cpu variable

Cc: Shailabh Nagar <nagar@watson.ibm.com>
Signed-off-by: Vegard Nossum <vegard.nossum@gmail.com>
---
 kernel/taskstats.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index 4a23517..e80788b 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -35,7 +35,7 @@
  */
 #define TASKSTATS_CPUMASK_MAXLEN	(100+6*NR_CPUS)
 
-static DEFINE_PER_CPU(__u32, taskstats_seqnum) = { 0 };
+static DEFINE_PER_CPU(__u32, taskstats_seqnum);
 static int family_registered;
 struct kmem_cache *taskstats_cache;
 
-- 
1.5.4.1

