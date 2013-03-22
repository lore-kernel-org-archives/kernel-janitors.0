From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Mar 2013 18:33:15 +0000
Subject: [patch -next] l2tp: calling the ref() instead of deref()
Message-Id: <20130322183314.GA23163@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: James Chapman <jchapman@katalix.com>, Tom Parkin <tparkin@katalix.com>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, kbuild@01.org

This is a cut and paste typo.  We call ->ref() a second time instead
of ->deref().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/net/l2tp/l2tp_core.c b/net/l2tp/l2tp_core.c
index 8aecf5d..6984c3a 100644
--- a/net/l2tp/l2tp_core.c
+++ b/net/l2tp/l2tp_core.c
@@ -1777,7 +1777,7 @@ int l2tp_session_delete(struct l2tp_session *session)
 	if (session->session_close != NULL)
 		(*session->session_close)(session);
 	if (session->deref)
-		(*session->ref)(session);
+		(*session->deref)(session);
 	l2tp_session_dec_refcount(session);
 	return 0;
 }
