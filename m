From: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Date: Fri, 01 Jul 2011 22:50:35 +0000
Subject: [PATCH] net: rds: fix const array syntax
Message-Id: <1309560635-17514-1-git-send-email-Gregory.Dietsche@cuw.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andy.grover@oracle.com
Cc: davem@davemloft.net, netdev@vger.kernel.org, rds-devel@oss.oracle.com, kernel-janitors@vger.kernel.org, Greg Dietsche <Gregory.Dietsche@cuw.edu>

Correct the syntax so that both array and pointer are const.

Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>
---
 net/rds/tcp_stats.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/rds/tcp_stats.c b/net/rds/tcp_stats.c
index d5898d0..f8a7954 100644
--- a/net/rds/tcp_stats.c
+++ b/net/rds/tcp_stats.c
@@ -40,7 +40,7 @@
 DEFINE_PER_CPU(struct rds_tcp_statistics, rds_tcp_stats)
 	____cacheline_aligned;
 
-static const char const *rds_tcp_stat_names[] = {
+static const char * const rds_tcp_stat_names[] = {
 	"tcp_data_ready_calls",
 	"tcp_write_space_calls",
 	"tcp_sndbuf_full",
-- 
1.7.2.5

