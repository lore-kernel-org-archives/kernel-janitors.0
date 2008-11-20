From: "Hannes Eder" <hannes@hanneseder.net>
Date: Thu, 20 Nov 2008 22:00:17 +0000
Subject: [PATCH] CRED: fix compilation warning in function 'get_cred'
Message-Id: <154e089b0811201400w6b5d249eyc21ebb9a76133d08@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to following warning by introducing a temporary variable:

include/linux/cred.h: In function 'get_cred':
include/linux/cred.h:187: warning: passing argument 1 of
'get_new_cred' discards qualifiers from pointer target type

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
With -O2 the same code as for the original function is generated.

 include/linux/cred.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/include/linux/cred.h b/include/linux/cred.h
index 26c1ab1..2ab8cf7 100644
--- a/include/linux/cred.h
+++ b/include/linux/cred.h
@@ -184,7 +184,8 @@ static inline struct cred *get_new_cred(struct cred *cred)
  */
 static inline const struct cred *get_cred(const struct cred *cred)
 {
-	return get_new_cred((struct cred *) cred);
+	struct cred *non_const_cred = (struct cred *) cred;
+	return get_new_cred(non_const_cred);
 }

 /**
