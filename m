From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 19:18:15 +0000
Subject: [PATCH] l2tp: Use seq_putc() in l2tp_dfs_seq_session_show()
Message-Id: <f0d5d925-ae8c-3ace-251b-99154c9a3881@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, David Windsor <dwindsor@gmail.com>, Elena Reshetova <elena.reshetova@intel.com>, Guillaume Nault <g.nault@alphalink.fr>, Hans Liljestrand <ishkamiel@gmail.com>, Kees Cook <keescook@chromium.org>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 13 Jan 2018 20:11:01 +0100

Two single characters (line breaks) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/l2tp/l2tp_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/l2tp/l2tp_debugfs.c b/net/l2tp/l2tp_debugfs.c
index 4cc30b38aba4..0a5add3ecdba 100644
--- a/net/l2tp/l2tp_debugfs.c
+++ b/net/l2tp/l2tp_debugfs.c
@@ -191,7 +191,7 @@ static void l2tp_dfs_seq_session_show(struct seq_file *m, void *v)
 			seq_printf(m, "%02x%02x%02x%02x",
 				   session->cookie[4], session->cookie[5],
 				   session->cookie[6], session->cookie[7]);
-		seq_printf(m, "\n");
+		seq_putc(m, '\n');
 	}
 	if (session->peer_cookie_len) {
 		seq_printf(m, "   peer cookie %02x%02x%02x%02x",
@@ -201,7 +201,7 @@ static void l2tp_dfs_seq_session_show(struct seq_file *m, void *v)
 			seq_printf(m, "%02x%02x%02x%02x",
 				   session->peer_cookie[4], session->peer_cookie[5],
 				   session->peer_cookie[6], session->peer_cookie[7]);
-		seq_printf(m, "\n");
+		seq_putc(m, '\n');
 	}
 
 	seq_printf(m, "   %hu/%hu tx %ld/%ld/%ld rx %ld/%ld/%ld\n",
-- 
2.15.1

