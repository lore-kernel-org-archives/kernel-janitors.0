From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 26 Dec 2015 21:57:43 +0000
Subject: [PATCH 1/2] ipc/mqueue: remove assignment from IS_ERR argument
Message-Id: <1451167064-2288-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451167064-2288-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451167064-2288-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2;
statement S1,S2;
@@

+e1 = e2;
if (IS_ERR(
    e1
-   = e2
   )) S1 else S2
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 ipc/mqueue.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ipc/mqueue.c b/ipc/mqueue.c
index f4617cf..3975abc 100644
--- a/ipc/mqueue.c
+++ b/ipc/mqueue.c
@@ -786,7 +786,8 @@ SYSCALL_DEFINE4(mq_open, const char __user *, u_name, int, oflag, umode_t, mode,
 
 	audit_mq_open(oflag, mode, u_attr ? &attr : NULL);
 
-	if (IS_ERR(name = getname(u_name)))
+	name = getname(u_name);
+	if (IS_ERR(name))
 		return PTR_ERR(name);
 
 	fd = get_unused_fd_flags(O_CLOEXEC);

