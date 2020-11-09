From: Colin King <colin.king@canonical.com>
Date: Mon, 09 Nov 2020 13:04:47 +0000
Subject: [PATCH][next] cpumask: allocate enough space for string and trailing '\0' char
Message-Id: <20201109130447.2080491-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Gortmaker <paul.gortmaker@windriver.com>, "Paul E . McKenney" <paulmck@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the allocation of cpulist is based on the length of buf but does
not include the addition end of string '\0' terminator. Static analysis is
reporting this as a potential out-of-bounds access on cpulist. Fix this by
allocating enough space for the additional '\0' terminator.

Addresses-Coverity: ("Out-of-bounds access")
Fixes: 65987e67f7ff ("cpumask: add "last" alias for cpu list specifications")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/cpumask.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/cpumask.c b/lib/cpumask.c
index 34ecb3005941..cb8a3ef0e73e 100644
--- a/lib/cpumask.c
+++ b/lib/cpumask.c
@@ -185,7 +185,7 @@ int __ref cpulist_parse(const char *buf, struct cpumask *dstp)
 {
 	int r;
 	char *cpulist, last_cpu[5];	/* NR_CPUS <= 9999 */
-	size_t len = strlen(buf);
+	size_t len = strlen(buf) + 1;
 	bool early = !slab_is_available();
 
 	if (!strcmp(buf, "all")) {
-- 
2.28.0
