From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Apr 2012 13:37:51 +0000
Subject: [patch] c/r: ipc: uninitialized variable in compat_do_msg_fill()
Message-Id: <20120413133751.GA26645@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Stanislav Kinsbursky <skinsbursky@parallels.com>
Cc: Chris Metcalf <cmetcalf@tilera.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We never initialize "msgp".  It's unfortunate that GCC doesn't warn
about this.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/ipc/compat.c b/ipc/compat.c
index 6da376b..0c2ebd0 100644
--- a/ipc/compat.c
+++ b/ipc/compat.c
@@ -363,7 +363,7 @@ static long compat_do_msg_steal(void __user *dest, struct msg_msg *msg, size_t b
 
 long compat_do_msg_fill(void __user *dest, struct msg_msg *msg, size_t bufsz)
 {
-	struct compat_msgbuf __user *msgp;
+	struct compat_msgbuf __user *msgp = dest;
 	size_t msgsz;
 
 	if (put_user(msg->m_type, &msgp->mtype))
