From: Colin King <colin.king@canonical.com>
Date: Sun, 25 Nov 2018 23:32:51 +0000
Subject: [PATCH] bpf: btf: fix spelling mistake "Memmber" -> "Member"
Message-Id: <20181125233251.14807-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a btf_verifier_log_member message,
fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/bpf/btf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 69da9169819a..a09b2f94ab25 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -1621,7 +1621,7 @@ static s32 btf_struct_check_meta(struct btf_verifier_env *env,
 
 		if (BITS_ROUNDUP_BYTES(member->offset) > struct_size) {
 			btf_verifier_log_member(env, t, member,
-						"Memmber bits_offset exceeds its struct size");
+						"Member bits_offset exceeds its struct size");
 			return -EINVAL;
 		}
 
-- 
2.19.1
