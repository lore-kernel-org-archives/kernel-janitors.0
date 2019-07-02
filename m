From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 17:13:18 +0000
Subject: [PATCH] bpf: Replace a seq_printf() call by seq_puts() in btf_enum_seq_show()
Message-Id: <93898abe-9a7d-0c64-0856-094b62e07ba2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: bpf@vger.kernel.org, netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 19:04:08 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/bpf/btf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 546ebee39e2a..679a19968f29 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -2426,9 +2426,8 @@ static void btf_enum_seq_show(const struct btf *btf, const struct btf_type *t,

 	for (i = 0; i < nr_enums; i++) {
 		if (v == enums[i].val) {
-			seq_printf(m, "%s",
-				   __btf_name_by_offset(btf,
-							enums[i].name_off));
+			seq_puts(m,
+				 __btf_name_by_offset(btf, enums[i].name_off));
 			return;
 		}
 	}
--
2.22.0
