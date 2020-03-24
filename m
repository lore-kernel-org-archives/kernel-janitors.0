From: Jean-Philippe Menil <jpmenil@gmail.com>
Date: Tue, 24 Mar 2020 07:22:31 +0000
Subject: [PATCH v2] bpf: fix build warning - missing prototype
Message-Id: <20200324072231.5780-1-jpmenil@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7c27e51f-6a64-7374-b705-450cad42146c@fb.com>
In-Reply-To: <7c27e51f-6a64-7374-b705-450cad42146c@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yhs@fb.com
Cc: kernel-janitors@vger.kernel.org, jpmenil@gmail.com, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Andrii Nakryiko <andriin@fb.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org

Fix build warnings when building net/bpf/test_run.o with W=1 due
to missing prototype for bpf_fentry_test{1..6}.

Declare prototypes in order to silence warnings.

Signed-off-by: Jean-Philippe Menil <jpmenil@gmail.com>
---
 net/bpf/test_run.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
index d555c0d8657d..cdf87fb0b6eb 100644
--- a/net/bpf/test_run.c
+++ b/net/bpf/test_run.c
@@ -113,31 +113,37 @@ static int bpf_test_finish(const union bpf_attr *kattr,
  * architecture dependent calling conventions. 7+ can be supported in the
  * future.
  */
+int noinline bpf_fentry_test1(int a);
 int noinline bpf_fentry_test1(int a)
 {
 	return a + 1;
 }
 
+int noinline bpf_fentry_test2(int a, u64 b);
 int noinline bpf_fentry_test2(int a, u64 b)
 {
 	return a + b;
 }
 
+int noinline bpf_fentry_test3(char a, int b, u64 c);
 int noinline bpf_fentry_test3(char a, int b, u64 c)
 {
 	return a + b + c;
 }
 
+int noinline bpf_fentry_test4(void *a, char b, int c, u64 d);
 int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
 {
 	return (long)a + b + c + d;
 }
 
+int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e);
 int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
 {
 	return a + (long)b + c + d + e;
 }
 
+int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f);
 int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
 {
 	return a + (long)b + c + d + (long)e + f;
-- 
2.25.2
