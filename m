From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Sep 2020 08:44:58 +0000
Subject: [PATCH] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()
Message-Id: <20200923084458.GD1454948@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms+renesas@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This code needs to call iounmap() on the error paths.

Fixes: 2ed29e15e4b2 ("ARM: shmobile: R-Mobile: Move pm-rmobile to drivers/soc/renesas/")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/renesas/rmobile-sysc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/rmobile-sysc.c
index 54b616ad4a62..d8e6dc650939 100644
--- a/drivers/soc/renesas/rmobile-sysc.c
+++ b/drivers/soc/renesas/rmobile-sysc.c
@@ -328,6 +328,7 @@ static int __init rmobile_init_pm_domains(void)
 		pmd = of_get_child_by_name(np, "pm-domains");
 		if (!pmd) {
 			pr_warn("%pOF lacks pm-domains node\n", np);
+			iounmap(base);
 			continue;
 		}
 
@@ -341,6 +342,7 @@ static int __init rmobile_init_pm_domains(void)
 		of_node_put(pmd);
 		if (ret) {
 			of_node_put(np);
+			iounmap(base);
 			break;
 		}
 	}
-- 
2.28.0
