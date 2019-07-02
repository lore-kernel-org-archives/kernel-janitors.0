From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 18:11:53 +0000
Subject: [PATCH] netfilter: nf_log: Replace a seq_printf() call by seq_puts() in seq_show()
Message-Id: <c7d397c8-4f41-1831-505f-b3fbcc3663fb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Florian Westphal <fw@strlen.de>, Jozsef Kadlecsik <kadlec@netfilter.org>, Pablo Neira Ayuso <pablo@netfilter.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 20:06:30 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/netfilter/nf_log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/netfilter/nf_log.c b/net/netfilter/nf_log.c
index 3574a212bdc2..bb25d4c794c7 100644
--- a/net/netfilter/nf_log.c
+++ b/net/netfilter/nf_log.c
@@ -374,7 +374,7 @@ static int seq_show(struct seq_file *s, void *v)
 			continue;

 		logger = nft_log_dereference(loggers[*pos][i]);
-		seq_printf(s, "%s", logger->name);
+		seq_puts(s, logger->name);
 		if (i == 0 && loggers[*pos][i + 1] != NULL)
 			seq_puts(s, ",");

--
2.22.0
