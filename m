From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Mar 2019 17:31:13 +0000
Subject: [PATCH][bpf-next] bpf: hbm: fix spelling mistake "deault" -> "default"
Message-Id: <20190305173113.26119-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of typos, fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 samples/bpf/hbm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/bpf/hbm.c b/samples/bpf/hbm.c
index 8408ccb7409f..a79828ab273f 100644
--- a/samples/bpf/hbm.c
+++ b/samples/bpf/hbm.c
@@ -18,7 +18,7 @@
  *		Default is /hbm1
  *    -r <rate>	Rate limit in Mbps
  *    -s	Get HBM stats (marked, dropped, etc.)
- *    -t <time>	Exit after specified seconds (deault is 0)
+ *    -t <time>	Exit after specified seconds (default is 0)
  *    -w	Work conserving flag. cgroup can increase its bandwidth
  *		beyond the rate limit specified while there is available
  *		bandwidth. Current implementation assumes there is only
@@ -376,7 +376,7 @@ static void Usage(void)
 	       "               Default is /hbm1\n"
 	       "    -r <rate>  Rate in Mbps\n"
 	       "    -s         Update HBM stats\n"
-	       "    -t <time>  Exit after specified seconds (deault is 0)\n"
+	       "    -t <time>  Exit after specified seconds (default is 0)\n"
 	       "    -w	       Work conserving flag. cgroup can increase\n"
 	       "               bandwidth beyond the rate limit specified\n"
 	       "               while there is available bandwidth. Current\n"
-- 
2.20.1
