From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 05:34:05 +0000
Subject: [PATCH 15/15] x86:Get rid of pointless cast of kzalloc() return value in crypto sha
Message-Id: <1429767245-32453-16-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Since kzalloc() returns a void pointer, we don't need to cast the
return value in arch/x86/crypto/sha-mb/sha1_mb.c::sha1_mb_mod_init().

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 arch/x86/crypto/sha-mb/sha1_mb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/crypto/sha-mb/sha1_mb.c b/arch/x86/crypto/sha-mb/sha1_mb.c
index e510b1c..0cb5149 100644
--- a/arch/x86/crypto/sha-mb/sha1_mb.c
+++ b/arch/x86/crypto/sha-mb/sha1_mb.c
@@ -885,7 +885,8 @@ static int __init sha1_mb_mod_init(void)
 		INIT_DELAYED_WORK(&cpu_state->flush, mcryptd_flusher);
 		cpu_state->cpu = cpu;
 		cpu_state->alg_state = &sha1_mb_alg_state;
-		cpu_state->mgr = (struct sha1_ctx_mgr *) kzalloc(sizeof(struct sha1_ctx_mgr), GFP_KERNEL);
+		cpu_state->mgr = kzalloc(sizeof(struct sha1_ctx_mgr),
+					GFP_KERNEL);
 		if (!cpu_state->mgr)
 			goto err2;
 		sha1_ctx_mgr_init(cpu_state->mgr);
-- 
2.1.0

