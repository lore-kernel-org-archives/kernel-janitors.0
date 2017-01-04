From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 04 Jan 2017 07:13:24 +0000
Subject: [PATCH] memory: tegra: Add a missing 'of_node_put()' call
Message-Id: <20170104071324.32721-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>

If 'of_find_device_by_node()' fails, an 'of_node_put()' call is missing in
the error handling path.
Fix it by reordering the code.

While at it, remove some empty lines in a more or less similar construction
a few lines below.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/memory/tegra/tegra124-emc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 06cc781ebac1..392dc8dd481f 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1115,11 +1115,10 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	}
 
 	mc = of_find_device_by_node(np);
+	of_node_put(np);
 	if (!mc)
 		return -ENOENT;
 
-	of_node_put(np);
-
 	emc->mc = platform_get_drvdata(mc);
 	if (!emc->mc)
 		return -EPROBE_DEFER;
@@ -1135,9 +1134,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
 	}
 
 	err = tegra_emc_load_timings_from_dt(emc, np);
-
 	of_node_put(np);
-
 	if (err)
 		return err;
 
-- 
2.9.3

