From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 26 Apr 2020 19:16:30 +0000
Subject: [PATCH] gpu: host1x: Clean up debugfs in error handling path in 'host1x_probe()'
Message-Id: <20200426191630.41290-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

'host1x_debug_init()' must be reverted in an error handling path.

This is already fixed in the remove function since commit 44156eee91ba
("gpu: host1x: Clean up debugfs on removal")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/host1x/dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 388bcc2889aa..be46554968af 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -435,6 +435,7 @@ static int host1x_probe(struct platform_device *pdev)
 	return 0;
 
 deinit_intr:
+	host1x_debug_deinit(host);
 	host1x_intr_deinit(host);
 deinit_syncpt:
 	host1x_syncpt_deinit(host);
-- 
2.25.1
