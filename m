From: Colin King <colin.king@canonical.com>
Date: Tue, 23 Jun 2020 08:42:07 +0000
Subject: [PATCH][next] libbpf: fix spelling mistake "kallasyms" -> "kallsyms"
Message-Id: <20200623084207.149253-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190619162742.985-1-colin.king@canonical.com>
In-Reply-To: <20190619162742.985-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/lib/bpf/libbpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 18461deb1b19..deea27aadcef 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -5741,7 +5741,7 @@ static int bpf_object__read_kallsyms_file(struct bpf_object *obj)
 		if (ret = EOF && feof(f))
 			break;
 		if (ret != 3) {
-			pr_warn("failed to read kallasyms entry: %d\n", ret);
+			pr_warn("failed to read kallsyms entry: %d\n", ret);
 			err = -EINVAL;
 			goto out;
 		}
-- 
2.27.0
