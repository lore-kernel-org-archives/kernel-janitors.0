From: Scott Thompson <postfailathushmaildotcom@yahoo.com>
Date: Thu, 23 Aug 2007 02:47:16 +0000
Subject: [PATCH resubmit] /drivers/ata ioremap returncode check
Message-Id: <159327.52462.qm@web44910.mail.sp1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070823023328.19E6CDA82B@mailserver7.hushmail.com>
In-Reply-To: <20070823023328.19E6CDA82B@mailserver7.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: brandon@ifup.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org

Patchset against 2.6.23-rc3.  corrects missing ioremap return 
checks, resending after making changes suggested....

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
------------------------------------------------------------
diff --git a/drivers/ata/pata_ixp4xx_cf.c b/drivers/ata/pata_ixp4xx_cf.c
index 4ca7fd6..8dc7c3b 100644
--- a/drivers/ata/pata_ixp4xx_cf.c
+++ b/drivers/ata/pata_ixp4xx_cf.c
@@ -189,6 +189,10 @@ static __devinit int ixp4xx_pata_probe(struct platform_device *pdev)
 	data->cs0 = devm_ioremap(&pdev->dev, cs0->start, 0x1000);
 	data->cs1 = devm_ioremap(&pdev->dev, cs1->start, 0x1000);
 
+	if (!data->cs0 || !data->cs1) {
+		return -ENOMEM;
+	}
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq)
 		set_irq_type(irq, IRQT_RISING);

> ----- Forwarded message from Brandon Philips <brandon@ifup.org> ----
> -
> The iounmap calls are unnecessary since devm_ioremap will un-
> allocate the space if you return an error from probe.  See
> Documentation/driver-model/devres.txt
> 
> But, something like this is needed.
> 
> +	if (!data->cs0 || !data->cs1)
> +		return -ENOMEM;
> 
> Thanks,	Brandon




       
____________________________________________________________________________________
Pinpoint customers who are looking for what you sell. 
http://searchmarketing.yahoo.com/


       
____________________________________________________________________________________
Building a website is a piece of cake. Yahoo! Small Business gives you all the tools to get online.
http://smallbusiness.yahoo.com/webhosting 

