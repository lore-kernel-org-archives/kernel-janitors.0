From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 12:15:35 +0000
Subject: [PATCH 1/2] kcm: Replace three seq_puts() calls by seq_putc()
Message-Id: <8c07d36a-24d4-5d50-d793-f42fd312ba03@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d9601df3-94c8-f15c-3a54-770604caf6a6@users.sourceforge.net>
In-Reply-To: <d9601df3-94c8-f15c-3a54-770604caf6a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, "David S. Miller" <davem@davemloft.net>, Jiri Slaby <jslaby@suse.cz>, Tom Herbert <tom@herbertland.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 13:53:41 +0200

Three single characters (line breaks) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/kcm/kcmproc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/kcm/kcmproc.c b/net/kcm/kcmproc.c
index bf75c9231cca..46b8b5f6c57f 100644
--- a/net/kcm/kcmproc.c
+++ b/net/kcm/kcmproc.c
@@ -116,7 +116,7 @@ static void kcm_format_mux_header(struct seq_file *seq)
 		   "Status");
 
 	/* XXX: pdsts header stuff here */
-	seq_puts(seq, "\n");
+	seq_putc(seq, '\n');
 }
 
 static void kcm_format_sock(struct kcm_sock *kcm, struct seq_file *seq,
@@ -146,7 +146,7 @@ static void kcm_format_sock(struct kcm_sock *kcm, struct seq_file *seq,
 	if (kcm->rx_wait)
 		seq_puts(seq, "RxWait ");
 
-	seq_puts(seq, "\n");
+	seq_putc(seq, '\n');
 }
 
 static void kcm_format_psock(struct kcm_psock *psock, struct seq_file *seq,
@@ -192,7 +192,7 @@ static void kcm_format_psock(struct kcm_psock *psock, struct seq_file *seq,
 			seq_puts(seq, "RdyRx ");
 	}
 
-	seq_puts(seq, "\n");
+	seq_putc(seq, '\n');
 }
 
 static void
-- 
2.12.2

