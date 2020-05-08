From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 May 2020 11:42:46 +0000
Subject: [PATCH] memory: tegra: Delete some dead code
Message-Id: <20200508114246.GA334755@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The debugfs_create_dir() function never returns NULL and anyway the
correct behavior is to ignore errors in this situation.  The
debugfs_create_file() will become a no-op if "emc->debugfs.root" is an
error pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/memory/tegra/tegra186-emc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 97f26bc77ad41..7c904e9bba8e8 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -241,11 +241,6 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 	}
 
 	emc->debugfs.root = debugfs_create_dir("emc", NULL);
-	if (!emc->debugfs.root) {
-		dev_err(&pdev->dev, "failed to create debugfs directory\n");
-		return 0;
-	}
-
 	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
 			    emc, &tegra186_emc_debug_available_rates_fops);
 	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
-- 
2.26.2
