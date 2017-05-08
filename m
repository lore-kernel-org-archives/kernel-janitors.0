From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 11:21:04 +0000
Subject: [PATCH 1/2] drm/etnaviv: Use seq_putc() in etnaviv_buffer_dump()
Message-Id: <ca952d88-058e-d6bd-dcdf-77f1fba1b346@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6652b09b-393b-01db-a0d4-de53dce8994e@users.sourceforge.net>
In-Reply-To: <6652b09b-393b-01db-a0d4-de53dce8994e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 13:00:28 +0200

Two single characters (line breaks) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 5255278dde56..b4deb26e1e40 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -182,12 +182,12 @@ static void etnaviv_buffer_dump(struct etnaviv_gpu *gpu, struct seq_file *m)
 
 	for (i = 0; i < size / 4; i++) {
 		if (i && !(i % 4))
-			seq_puts(m, "\n");
+			seq_putc(m, '\n');
 		if (i % 4 = 0)
 			seq_printf(m, "\t0x%p: ", ptr + i);
 		seq_printf(m, "%08x ", *(ptr + i));
 	}
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
 }
 
 static int etnaviv_ring_show(struct etnaviv_gpu *gpu, struct seq_file *m)
-- 
2.12.2

