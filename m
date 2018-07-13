From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jul 2018 15:05:37 +0000
Subject: [PATCH 2/2] samples/bpf: test_cgrp2_sock2: fix an off by one
Message-Id: <20180713150301.gdvfu2ejlzlnglii@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"prog_cnt" is the number of elements which are filled out in prog_fd[]
so the test should be >= instead of >.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/samples/bpf/test_cgrp2_sock2.c b/samples/bpf/test_cgrp2_sock2.c
index 3b5be2364975..a9277b118c33 100644
--- a/samples/bpf/test_cgrp2_sock2.c
+++ b/samples/bpf/test_cgrp2_sock2.c
@@ -51,7 +51,7 @@ int main(int argc, char **argv)
 	if (argc > 3)
 		filter_id = atoi(argv[3]);
 
-	if (filter_id > prog_cnt) {
+	if (filter_id >= prog_cnt) {
 		printf("Invalid program id; program not found in file\n");
 		return EXIT_FAILURE;
 	}
