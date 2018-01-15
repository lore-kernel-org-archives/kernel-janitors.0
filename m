From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Jan 2018 08:15:47 +0000
Subject: [PATCH] tools/bpftool: silence a static check warning
Message-Id: <20180115081547.bf2u3aqitnm3bmtl@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a static checker warning that proglen has an upper bound but no
lower bound.  The allocation will just fail harmlessly so it's not a big
deal.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/tools/bpf/bpf_jit_disasm.c b/tools/bpf/bpf_jit_disasm.c
index 30044bc4f389..2d7bb5dc0b8c 100644
--- a/tools/bpf/bpf_jit_disasm.c
+++ b/tools/bpf/bpf_jit_disasm.c
@@ -205,7 +205,7 @@ static uint8_t *get_last_jit_image(char *haystack, size_t hlen,
 		regfree(&regex);
 		return NULL;
 	}
-	if (proglen > 1000000) {
+	if (proglen < 0 || proglen > 1000000) {
 		printf("proglen of %d too big, stopping\n", proglen);
 		return NULL;
 	}
