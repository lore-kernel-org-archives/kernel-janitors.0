From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 Jan 2018 21:44:08 +0000
Subject: [PATCH] atm/clip: Use seq_puts() in svc_addr()
Message-Id: <97636808-1d9f-d196-ebce-fbd2505c50e2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, "David S. Miller" <davem@davemloft.net>, David Windsor <dwindsor@gmail.com>, Elena Reshetova <elena.reshetova@intel.com>, Hans Liljestrand <ishkamiel@gmail.com>, Johannes Berg <johannes.berg@intel.com>, Kees Cook <keescook@chromium.org>, Roopa Prabhu <roopa@cumulusnetworks.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 22:34:12 +0100

Two strings should be quickly put into a sequence by two function calls.
Thus use the function "seq_puts" instead of "seq_printf".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/atm/clip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/atm/clip.c b/net/atm/clip.c
index d4f6029d5109..62a852165b19 100644
--- a/net/atm/clip.c
+++ b/net/atm/clip.c
@@ -708,11 +708,11 @@ static void svc_addr(struct seq_file *seq, struct sockaddr_atmsvc *addr)
 	static int e164[] = { 1, 8, 4, 6, 1, 0 };
 
 	if (*addr->sas_addr.pub) {
-		seq_printf(seq, "%s", addr->sas_addr.pub);
+		seq_puts(seq, addr->sas_addr.pub);
 		if (*addr->sas_addr.prv)
 			seq_putc(seq, '+');
 	} else if (!*addr->sas_addr.prv) {
-		seq_printf(seq, "%s", "(none)");
+		seq_puts(seq, "(none)");
 		return;
 	}
 	if (*addr->sas_addr.prv) {
-- 
2.15.1

