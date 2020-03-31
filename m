From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Mar 2020 10:00:30 +0000
Subject: [PATCH][next] bpf: Test_verifier: fix spelling mistake "arithmatic" -> "arithmetic"
Message-Id: <20200331100030.41372-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of spelling mistakes in two literal strings, fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/bpf/verifier/bounds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/verifier/bounds.c b/tools/testing/selftests/bpf/verifier/bounds.c
index 4d0d09574bf4..a253a064e6e0 100644
--- a/tools/testing/selftests/bpf/verifier/bounds.c
+++ b/tools/testing/selftests/bpf/verifier/bounds.c
@@ -501,7 +501,7 @@
 	.result = REJECT
 },
 {
-	"bounds check mixed 32bit and 64bit arithmatic. test1",
+	"bounds check mixed 32bit and 64bit arithmetic. test1",
 	.insns = {
 	BPF_MOV64_IMM(BPF_REG_0, 0),
 	BPF_MOV64_IMM(BPF_REG_1, -1),
@@ -520,7 +520,7 @@
 	.result = ACCEPT
 },
 {
-	"bounds check mixed 32bit and 64bit arithmatic. test2",
+	"bounds check mixed 32bit and 64bit arithmetic. test2",
 	.insns = {
 	BPF_MOV64_IMM(BPF_REG_0, 0),
 	BPF_MOV64_IMM(BPF_REG_1, -1),
-- 
2.25.1
