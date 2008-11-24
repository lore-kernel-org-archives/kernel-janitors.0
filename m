From: "Hannes Eder" <hannes@hanneseder.net>
Date: Mon, 24 Nov 2008 21:14:43 +0000
Subject: [PATCH] CRED: fix sparse warnings
Message-Id: <154e089b0811241314t3291ea30w6268bb5b2b5c7c53@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Impact: fix sparse warnings

Fix the following sparse warnings:

  security/security.c:228:2: warning: returning void-valued expression
  security/security.c:233:2: warning: returning void-valued expression
  security/security.c:616:2: warning: returning void-valued expression

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 security/security.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/security/security.c b/security/security.c
index 038ef04..f0d96a6 100644
--- a/security/security.c
+++ b/security/security.c
@@ -225,12 +225,12 @@ int security_bprm_check(struct linux_binprm *bprm)

 void security_bprm_committing_creds(struct linux_binprm *bprm)
 {
-	return security_ops->bprm_committing_creds(bprm);
+	security_ops->bprm_committing_creds(bprm);
 }

 void security_bprm_committed_creds(struct linux_binprm *bprm)
 {
-	return security_ops->bprm_committed_creds(bprm);
+	security_ops->bprm_committed_creds(bprm);
 }

 int security_bprm_secureexec(struct linux_binprm *bprm)
@@ -613,7 +613,7 @@ int security_prepare_creds(struct cred *new, const
struct cred *old, gfp_t gfp)

 void security_commit_creds(struct cred *new, const struct cred *old)
 {
-	return security_ops->cred_commit(new, old);
+	security_ops->cred_commit(new, old);
 }

 int security_kernel_act_as(struct cred *new, u32 secid)
-- 
1.5.6.3
