From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 16 Mar 2013 09:48:11 +0000
Subject: [patch] selinux: use GFP_ATOMIC under spin_lock
Message-Id: <20130316094811.GA10825@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The call tree here is:

sk_clone_lock()              <- takes bh_lock_sock(newsk);
xfrm_sk_clone_policy()
__xfrm_sk_clone_policy()
clone_policy()               <- uses GFP_ATOMIC for allocations
security_xfrm_policy_clone()
security_ops->xfrm_policy_clone_security()
selinux_xfrm_policy_clone()

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker work.

diff --git a/security/selinux/xfrm.c b/security/selinux/xfrm.c
index 48665ec..8ab2951 100644
--- a/security/selinux/xfrm.c
+++ b/security/selinux/xfrm.c
@@ -310,7 +310,7 @@ int selinux_xfrm_policy_clone(struct xfrm_sec_ctx *old_ctx,
 
 	if (old_ctx) {
 		new_ctx = kmalloc(sizeof(*old_ctx) + old_ctx->ctx_len,
-				  GFP_KERNEL);
+				  GFP_ATOMIC);
 		if (!new_ctx)
 			return -ENOMEM;
 
