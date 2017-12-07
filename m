From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 07 Dec 2017 20:19:31 +0000
Subject: [PATCH 1/2] serial: tegra: Delete an error message for a failed memory allocation in tegra_uart_prob
Message-Id: <aee3d79d-a59e-a3fd-6c6b-45ee46132cc6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <605adc2b-3591-86fc-410a-370f48dfb14e@users.sourceforge.net>
In-Reply-To: <605adc2b-3591-86fc-410a-370f48dfb14e-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jiri Slaby <jslaby-IBi9RG/b67k@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 7 Dec 2017 21:00:05 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/tty/serial/serial-tegra.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/tty/serial/serial-tegra.c b/drivers/tty/serial/serial-tegra.c
index af2a29cfbbe9..46233c5974f1 100644
--- a/drivers/tty/serial/serial-tegra.c
+++ b/drivers/tty/serial/serial-tegra.c
@@ -1265,10 +1265,8 @@ static int tegra_uart_probe(struct platform_device *pdev)
 	cdata = match->data;
 
 	tup = devm_kzalloc(&pdev->dev, sizeof(*tup), GFP_KERNEL);
-	if (!tup) {
-		dev_err(&pdev->dev, "Failed to allocate memory for tup\n");
+	if (!tup)
 		return -ENOMEM;
-	}
 
 	ret = tegra_uart_parse_dt(pdev, tup);
 	if (ret < 0)
-- 
2.15.1

