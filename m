From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Jul 2018 08:38:59 +0000
Subject: [PATCH] bpf: sockmap: remove redundant pointer sg
Message-Id: <20180717083859.17525-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer sg is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'sg' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/bpf/sockmap.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/bpf/sockmap.c b/kernel/bpf/sockmap.c
index 98fb7938beea..0b38be5a955c 100644
--- a/kernel/bpf/sockmap.c
+++ b/kernel/bpf/sockmap.c
@@ -725,11 +725,8 @@ static int bpf_tcp_sendmsg_do_redirect(struct sock *sk, int send,
 {
 	bool ingress = !!(md->flags & BPF_F_INGRESS);
 	struct smap_psock *psock;
-	struct scatterlist *sg;
 	int err = 0;
 
-	sg = md->sg_data;
-
 	rcu_read_lock();
 	psock = smap_psock_sk(sk);
 	if (unlikely(!psock))
-- 
2.17.1

