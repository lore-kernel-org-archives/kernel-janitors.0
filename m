From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 07 May 2017 09:52:54 +0000
Subject: [PATCH 2/3] thermal: tegra: Use seq_putc() in regs_show()
Message-Id: <e9e495b9-897c-af37-4749-f175a7b9f7c0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b0795133-ebb9-56b3-567d-b3773f298789@users.sourceforge.net>
In-Reply-To: <b0795133-ebb9-56b3-567d-b3773f298789-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 7 May 2017 10:57:40 +0200

A single character (line break) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/thermal/tegra/soctherm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index c5871f9b6596..1b3915588bce 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -661,6 +661,6 @@ static int regs_show(struct seq_file *s, void *data)
 
 		if (!state) {
-			seq_puts(s, "\n");
+			seq_putc(s, '\n');
 			continue;
 		}
 
-- 
2.12.2

