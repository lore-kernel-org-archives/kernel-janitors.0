From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Apr 2018 14:04:59 +0000
Subject: [PATCH 2/2] bpf: btf: remove a couple conditions
Message-Id: <20180427140459.GB19583@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We know "err" is zero so we can remove these and pull the code in one
indent level.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This applies to the BPF tree (linux-next)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index e631b6fd60d3..7cb0905f37c2 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -1973,16 +1973,14 @@ static struct btf *btf_parse(void __user *btf_data, u32 btf_data_size,
 	if (err)
 		goto errout;
 
-	if (!err && log->level && bpf_verifier_log_full(log)) {
+	if (log->level && bpf_verifier_log_full(log)) {
 		err = -ENOSPC;
 		goto errout;
 	}
 
-	if (!err) {
-		btf_verifier_env_free(env);
-		btf_get(btf);
-		return btf;
-	}
+	btf_verifier_env_free(env);
+	btf_get(btf);
+	return btf;
 
 errout:
 	btf_verifier_env_free(env);
