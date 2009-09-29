From: Dirk Hohndel <hohndel@infradead.org>
Date: Tue, 29 Sep 2009 01:56:07 +0000
Subject: [PATCH] trivial fix of a very frequent spelling mistake
Message-Id: <20090929015607.GA18220@bombadil.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090929014357.GA3597@bombadil.infradead.org>
In-Reply-To: <20090929014357.GA3597@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jin Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jeff Garzik <jgarzik@pobox.com>, linux-ide@vger.kernel.org

something-bility is spelled as something-blity
so a grep for 'blit' would find these lines

I broke this one out from the rest as it actually changes
the output of a kernel message - so it could in theory
change the behavior of tools that parse that ouput

Jeff, can you sign-off / NAK this, please?

Signed-off-by: Dirk Hohndel <hohndel@infradead.org>
---
 drivers/ata/pata_ali.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/ata/pata_ali.c b/drivers/ata/pata_ali.c
index fc9c5d6..1432dc9 100644
--- a/drivers/ata/pata_ali.c
+++ b/drivers/ata/pata_ali.c
@@ -290,7 +290,7 @@ static void ali_warn_atapi_dma(struct ata_device *adev)
 
 	if (print_info && adev->class = ATA_DEV_ATAPI && !ali_atapi_dma) {
 		ata_dev_printk(adev, KERN_WARNING,
-			       "WARNING: ATAPI DMA disabled for reliablity issues.  It can be enabled\n");
+			       "WARNING: ATAPI DMA disabled for reliability issues.  It can be enabled\n");
 		ata_dev_printk(adev, KERN_WARNING,
 			       "WARNING: via pata_ali.atapi_dma modparam or corresponding sysfs node.\n");
 	}
-- 
1.6.2.5

