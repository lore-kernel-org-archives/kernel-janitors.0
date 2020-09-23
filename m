From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Sep 2020 11:31:42 +0000
Subject: [PATCH v2] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()
Message-Id: <20200923113142.GC1473821@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <CAMuHMdXyM1dUPJ7ZDAk6-cEjaG_bVBfsE=bqdpf7pA0ChdRLVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms+renesas@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This code needs to call iounmap() on one error path.

Fixes: 2173fc7cb681 ("ARM: shmobile: R-Mobile: Add DT support for PM domains")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2:  The v1 patch potentially led to a use after free.

 drivers/soc/renesas/rmobile-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/rmobile-sysc.c b/drivers/soc/renesas/rmobile-sysc.c
index 54b616ad4a62..beb1c7211c3d 100644
--- a/drivers/soc/renesas/rmobile-sysc.c
+++ b/drivers/soc/renesas/rmobile-sysc.c
@@ -327,6 +327,7 @@ static int __init rmobile_init_pm_domains(void)
 
 		pmd = of_get_child_by_name(np, "pm-domains");
 		if (!pmd) {
+			iounmap(base);
 			pr_warn("%pOF lacks pm-domains node\n", np);
 			continue;
 		}
-- 
2.28.0
