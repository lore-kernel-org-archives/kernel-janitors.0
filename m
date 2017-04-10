From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 10 Apr 2017 20:29:22 +0000
Subject: [PATCH] gpu: host1x: Fix error handling
Message-Id: <20170410202922.17665-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>

If 'devm_reset_control_get' returns an error, then we erroneously return
success because error code is taken from 'host->clk' instead of 
'host->rst'.

Fixes: b386c6b73ac6 ("gpu: host1x: Support module reset")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/host1x/dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index f05ebb14fa63..ac65f52850a6 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -172,7 +172,7 @@ static int host1x_probe(struct platform_device *pdev)
 
 	host->rst = devm_reset_control_get(&pdev->dev, "host1x");
 	if (IS_ERR(host->rst)) {
-		err = PTR_ERR(host->clk);
+		err = PTR_ERR(host->rst);
 		dev_err(&pdev->dev, "failed to get reset: %d\n", err);
 		return err;
 	}
-- 
2.11.0

