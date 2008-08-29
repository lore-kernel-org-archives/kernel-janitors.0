From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 29 Aug 2008 20:33:55 +0000
Subject: [PATCH] Fix build warning in kernel/auditsc.c
Message-Id: <48b93353.02e2660a.0e28.3e54@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix this:

kernel/auditsc.c: In function 'audit_match_perm':
kernel/auditsc.c:249: warning: ISO C90 forbids mixed declarations and code

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 kernel/auditsc.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 972f8e6..e72b161 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -243,10 +243,12 @@ static inline int open_arg(int flags, int mask)
 
 static int audit_match_perm(struct audit_context *ctx, int mask)
 {
+	unsigned n;
+
 	if (unlikely(!ctx))
 		return 0;
 
-	unsigned n = ctx->major;
+	n = ctx->major;
 	switch (audit_classify_syscall(ctx->arch, n)) {
 	case 0:	/* native */
 		if ((mask & AUDIT_PERM_WRITE) &&
