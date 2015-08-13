From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Aug 2015 20:27:47 +0000
Subject: [patch -next] bpf: off by one in check_map_func_compatibility()
Message-Id: <20150813202747.GA6478@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Kaixu Xia <xiakaixu@huawei.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The loop iterates one space too far, so we might read beyond the end of
the func_limit[] array.

Fixes: 35578d798400 ('bpf: Implement function bpf_perf_event_read() that get the selected hardware PMU conuter')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 48e1c71..ed12e38 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -853,7 +853,7 @@ static int check_map_func_compatibility(struct bpf_map *map, int func_id)
 	if (!map)
 		return 0;
 
-	for (i = 0; i <= ARRAY_SIZE(func_limit); i++) {
+	for (i = 0; i < ARRAY_SIZE(func_limit); i++) {
 		bool_map = (map->map_type = func_limit[i].map_type);
 		bool_func = (func_id = func_limit[i].func_id);
 		/* only when map & func pair match it can continue.
