From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Jan 2018 09:35:21 +0000
Subject: [PATCH v2] tools/bpftool: silence a static checker warning
Message-Id: <20180118093521.GA19707@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2c2c2cf6-acf2-af9f-83ef-21dbcd0a5551@iogearbox.net>
In-Reply-To: <2c2c2cf6-acf2-af9f-83ef-21dbcd0a5551@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a static checker warning that "proglen" has an upper bound but
no lower bound.  The allocation will just fail harmlessly so it's not a
big deal.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: change the type to unsigned instead of checking for negatives

diff --git a/tools/bpf/bpf_jit_disasm.c b/tools/bpf/bpf_jit_disasm.c
index 30044bc4f389..58c2bab4ef6e 100644
--- a/tools/bpf/bpf_jit_disasm.c
+++ b/tools/bpf/bpf_jit_disasm.c
@@ -172,7 +172,8 @@ static uint8_t *get_last_jit_image(char *haystack, size_t hlen,
 {
 	char *ptr, *pptr, *tmp;
 	off_t off = 0;
-	int ret, flen, proglen, pass, ulen = 0;
+	unsigned int proglen;
+	int ret, flen, pass, ulen = 0;
 	regmatch_t pmatch[1];
 	unsigned long base;
 	regex_t regex;
@@ -199,7 +200,7 @@ static uint8_t *get_last_jit_image(char *haystack, size_t hlen,
 	}
 
 	ptr = haystack + off - (pmatch[0].rm_eo - pmatch[0].rm_so);
-	ret = sscanf(ptr, "flen=%d proglen=%d pass=%d image=%lx",
+	ret = sscanf(ptr, "flen=%d proglen=%u pass=%d image=%lx",
 		     &flen, &proglen, &pass, &base);
 	if (ret != 4) {
 		regfree(&regex);
@@ -239,7 +240,7 @@ static uint8_t *get_last_jit_image(char *haystack, size_t hlen,
 	}
 
 	assert(ulen = proglen);
-	printf("%d bytes emitted from JIT compiler (pass:%d, flen:%d)\n",
+	printf("%u bytes emitted from JIT compiler (pass:%d, flen:%d)\n",
 	       proglen, pass, flen);
 	printf("%lx + <x>:\n", base);
 
