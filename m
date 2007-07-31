From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 22:13:20 +0000
Subject: [PATCH 77] sound/oss/via82cxxx_audio.c: kmalloc + memset conversion to kzalloc
Message-Id: <200708010013.21068.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, jgarzik@pobox.com

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 sound/oss/via82cxxx_audio.c | 91182 -> 91145 (-37 bytes)
 sound/oss/via82cxxx_audio.o | 180104 -> 179984 (-120 bytes)

 sound/oss/via82cxxx_audio.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-2.6.23-rc1-mm1-a/sound/oss/via82cxxx_audio.c	2007-07-26 13:07:39.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/sound/oss/via82cxxx_audio.c	2007-07-31 15:23:27.000000000 +0200
@@ -3401,7 +3401,7 @@ static int __devinit via_init_one (struc
 	if (rc)
 		goto err_out_res;

-	card = kmalloc (sizeof (*card), GFP_KERNEL);
+	card = kzalloc(sizeof(*card), GFP_KERNEL);
 	if (!card) {
 		printk (KERN_ERR PFX "out of memory, aborting\n");
 		rc = -ENOMEM;
@@ -3410,7 +3410,6 @@ static int __devinit via_init_one (struc

 	pci_set_drvdata (pdev, card);

-	memset (card, 0, sizeof (*card));
 	card->pdev = pdev;
 	card->baseaddr = pci_resource_start (pdev, 0);
 	card->card_num = via_num_cards++;
