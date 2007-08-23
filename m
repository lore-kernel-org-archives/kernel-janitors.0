From: Scott Thompson <postfailathushmaildotcom@yahoo.com>
Date: Thu, 23 Aug 2007 19:34:31 +0000
Subject: [PATCH resubmit] /drivers/ata ioremap returncode check
Message-Id: <648310.70195.qm@web44903.mail.sp1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <159327.52462.qm@web44910.mail.sp1.yahoo.com>
In-Reply-To: <159327.52462.qm@web44910.mail.sp1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: brandon@ifup.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org

Patchset against 2.6.23-rc3.  corrects missing ioremap return 
checks, resending after fixing for documentation making changes suggested...

As for suggestions, I did fix the {} that weren't needed.  I did not add in a
"printk" err or warn statement as the rest of the module does not contain these
messages.  When auditing (as I am for ioremap checking here) I am attempting
to keep changes "in the style of their surroundings".  Otherwise it's massive
scope screep on these patches.
 
Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
---------------------------------------------------------------
diff --git a/drivers/ata/pata_ixp4xx_cf.c b/drivers/ata/pata_ixp4xx_cf.c
index 4ca7fd6..6f9a2b7 100644
--- a/drivers/ata/pata_ixp4xx_cf.c
+++ b/drivers/ata/pata_ixp4xx_cf.c
@@ -189,6 +189,9 @@ static __devinit int ixp4xx_pata_probe(struct platform_device *pdev)
 	data->cs0 = devm_ioremap(&pdev->dev, cs0->start, 0x1000);
 	data->cs1 = devm_ioremap(&pdev->dev, cs1->start, 0x1000);
 
+	if (!data->cs0 || !data->cs1) 
+		return -ENOMEM;
+	
 	irq = platform_get_irq(pdev, 0);
 	if (irq)
 		set_irq_type(irq, IRQT_RISING);


       
____________________________________________________________________________________
Moody friends. Drama queens. Your life? Nope! - their life, your story. Play Sims Stories at
Yahoo! Games.
http://sims.yahoo.com/  


       
____________________________________________________________________________________
Looking for a deal? Find great prices on flights and hotels with Yahoo! FareChase.
http://farechase.yahoo.com/

