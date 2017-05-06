From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 12:16:22 +0000
Subject: [PATCH 2/2] kcm: Use seq_puts() in kcm_format_psock()
Message-Id: <5bb0b898-a506-1fdd-19ab-3c3988c077b2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d9601df3-94c8-f15c-3a54-770604caf6a6@users.sourceforge.net>
In-Reply-To: <d9601df3-94c8-f15c-3a54-770604caf6a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, "David S. Miller" <davem@davemloft.net>, Jiri Slaby <jslaby@suse.cz>, Tom Herbert <tom@herbertland.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 14:04:02 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/kcm/kcmproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/kcm/kcmproc.c b/net/kcm/kcmproc.c
index 46b8b5f6c57f..b59b46822d9e 100644
--- a/net/kcm/kcmproc.c
+++ b/net/kcm/kcmproc.c
@@ -182,7 +182,7 @@ static void kcm_format_psock(struct kcm_psock *psock, struct seq_file *seq,
 				seq_printf(seq, "RxWait=%u ",
 					   psock->strp.rx_need_bytes);
 			else
-				seq_printf(seq, "RxWait ");
+				seq_puts(seq, "RxWait ");
 		}
 	} else  {
 		if (psock->strp.rx_paused)
-- 
2.12.2

