From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 11:22:30 +0000
Subject: [PATCH 2/2] drm/etnaviv: Delete an error message for a failed memory allocation in etnaviv_bind()
Message-Id: <782e850b-0376-c641-8ede-7b9ed6d385b9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6652b09b-393b-01db-a0d4-de53dce8994e@users.sourceforge.net>
In-Reply-To: <6652b09b-393b-01db-a0d4-de53dce8994e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@linux.ie>, Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 13:08:11 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: Possible unnecessary 'out of memory' message

Thus remove such a statement here.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index b4deb26e1e40..b121473622d0 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -530,7 +530,6 @@ static int etnaviv_bind(struct device *dev)
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
-		dev_err(dev, "failed to allocate private data\n");
 		ret = -ENOMEM;
 		goto out_unref;
 	}
-- 
2.12.2

