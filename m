From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 23 Jun 2017 06:24:40 +0000
Subject: [PATCH] RAS: Fix an error checking test in 'create_debugfs_nodes()'
Message-Id: <20170623062440.6726-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bp@suse.de, mingo@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'decay' is kwown to be not NULL at this point.
'count' should be tested instead.

Fixes: 011d82611172 ("RAS: Add a Corrected Errors Collector")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/ras/cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 6aab46d91d33..d0e5d6ee882c 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -481,7 +481,7 @@ static int __init create_debugfs_nodes(void)
 
 	count = debugfs_create_file("count_threshold", S_IRUSR | S_IWUSR, d,
 				    &count_threshold, &count_threshold_ops);
-	if (!decay) {
+	if (!count) {
 		pr_warn("Error creating count_threshold debugfs node!\n");
 		goto err;
 	}
-- 
2.11.0

