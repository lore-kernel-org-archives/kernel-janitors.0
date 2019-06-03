From: Colin King <colin.king@canonical.com>
Date: Mon, 03 Jun 2019 13:36:53 +0000
Subject: [PATCH][next] bpf: hbm: fix spelling mistake "notifcations" -> "notificiations"
Message-Id: <20190603133653.18185-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the help information, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 samples/bpf/hbm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/bpf/hbm.c b/samples/bpf/hbm.c
index 480b7ad6a1f2..bdfce592207a 100644
--- a/samples/bpf/hbm.c
+++ b/samples/bpf/hbm.c
@@ -411,7 +411,7 @@ static void Usage(void)
 	       "    -l         also limit flows using loopback\n"
 	       "    -n <#>     to create cgroup \"/hbm#\" and attach prog\n"
 	       "               Default is /hbm1\n"
-	       "    --no_cn    disable CN notifcations\n"
+	       "    --no_cn    disable CN notifications\n"
 	       "    -r <rate>  Rate in Mbps\n"
 	       "    -s         Update HBM stats\n"
 	       "    -t <time>  Exit after specified seconds (default is 0)\n"
-- 
2.20.1
