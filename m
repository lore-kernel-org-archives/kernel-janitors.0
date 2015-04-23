From: Firo Yang <firogm@gmail.com>
Date: Thu, 23 Apr 2015 10:12:10 +0000
Subject: [PATCH] crypto: sha1-mb - Remove pointless cast
Message-Id: <1429783930-7318-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au
Cc: kernel-janitors@vger.kernel.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, tim.c.chen@linux.intel.com, smueller@chronox.de, minipli@googlemail.com, dan.carpenter@oracle.com, ameenali023@gmail.com, fengguang.wu@intel.com, linux-crypto@vger.kernel.org, Firo Yang <firogm@gmail.com>

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

