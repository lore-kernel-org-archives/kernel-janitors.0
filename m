From: Jean-Philippe Menil <jpmenil@gmail.com>
Date: Fri, 27 Mar 2020 20:47:13 +0000
Subject: [PATCH v4] bpf: fix build warning - missing prototype
Message-Id: <20200327204713.28050-1-jpmenil@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3164e566-d54e-2254-32c4-d7fee47c37ea@iogearbox.net>
In-Reply-To: <3164e566-d54e-2254-32c4-d7fee47c37ea@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: daniel@iogearbox.net
Cc: kernel-janitors@vger.kernel.org, jpmenil@gmail.com, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org

Fix build warnings when building net/bpf/test_run.o with W=1 due
to missing prototype for bpf_fentry_test{1..6}.

Instead of declaring prototypes, turn off warnings with
__diag_{push,ignore,pop} as pointed by Alexei.

Signed-off-by: Jean-Philippe Menil <jpmenil@gmail.com>
---
 net/bpf/test_run.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index 4c921f5154e0..73e703895343 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -114,6 +114,9 @@ static int bpf_test_finish(const union bpf_attr *kattr,
  * architecture dependent calling conventions. 7+ can be supported in the
  * future.
  */
+__diag_push();
+__diag_ignore(GCC, 8, "-Wmissing-prototypes",
+	      "Global functions as their definitions will be in vmlinux BTF");
 int noinline bpf_fentry_test1(int a)
 {
 	return a + 1;
@@ -150,6 +153,8 @@ int noinline bpf_modify_return_test(int a, int *b)
 	return a + *b;
 }
 
+__diag_pop();
+
 ALLOW_ERROR_INJECTION(bpf_modify_return_test, ERRNO);
 
 static void *bpf_test_init(const union bpf_attr *kattr, u32 size,
-- 
2.26.0
