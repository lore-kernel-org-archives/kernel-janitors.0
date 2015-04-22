From: Firo Yang <firogm@gmail.com>
Date: Wed, 22 Apr 2015 16:35:29 +0000
Subject: [PATCH 15/16] Clean up unnecessary void* pointer cast.
Message-Id: <1429720530-20044-15-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 arch/x86/crypto/sha-mb/sha1_mb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/crypto/sha-mb/sha1_mb.c b/arch/x86/crypto/sha-mb/sha1_mb.c
index e510b1c..77357fb 100644
--- a/arch/x86/crypto/sha-mb/sha1_mb.c
+++ b/arch/x86/crypto/sha-mb/sha1_mb.c
@@ -885,7 +885,7 @@ static int __init sha1_mb_mod_init(void)
 		INIT_DELAYED_WORK(&cpu_state->flush, mcryptd_flusher);
 		cpu_state->cpu = cpu;
 		cpu_state->alg_state = &sha1_mb_alg_state;
-		cpu_state->mgr = (struct sha1_ctx_mgr *) kzalloc(sizeof(struct sha1_ctx_mgr), GFP_KERNEL);
+		cpu_state->mgr = kzalloc(sizeof(struct sha1_ctx_mgr), GFP_KERNEL);
 		if (!cpu_state->mgr)
 			goto err2;
 		sha1_ctx_mgr_init(cpu_state->mgr);
-- 
2.1.0

