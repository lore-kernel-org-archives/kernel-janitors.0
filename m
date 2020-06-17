From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 17 Jun 2020 19:53:26 +0000
Subject: [PATCH] pcmcia/electra_cf: Fix some return values in 'electra_cf_probe()' in case of error
Message-Id: <20200617195326.732863-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@dominikbrodowski.net, akpm@linux-foundation.org, peterz@infradead.org, olof@lixom.net, hch@lst.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'status' is known to be 0 at this point. It must be set to a meaningful
value in order to return an error code if one of the 'of_get_property()'
call fails.

Return -EINVAL in such a case.

Fixes: 2b571a066a2f("pcmcia: CompactFlash driver for PA Semi Electra boards")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/pcmcia/electra_cf.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pcmcia/electra_cf.c b/drivers/pcmcia/electra_cf.c
index 35158cfd9c1a..40a5cffe24a4 100644
--- a/drivers/pcmcia/electra_cf.c
+++ b/drivers/pcmcia/electra_cf.c
@@ -229,6 +229,8 @@ static int electra_cf_probe(struct platform_device *ofdev)
 
 	cf->socket.pci_irq = cf->irq;
 
+	status = -EINVAL;
+
 	prop = of_get_property(np, "card-detect-gpio", NULL);
 	if (!prop)
 		goto fail1;
-- 
2.25.1
