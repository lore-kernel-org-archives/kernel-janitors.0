From: "Scott Thompson" <postfail@hushmail.com>
Date: Mon, 13 Aug 2007 04:06:39 +0000
Subject: [PATCH 5 of 5 ] /drivers/char/watchdog ioremap balancing/ returncode check
Message-Id: <20070813040639.F067ADA820@mailserver8.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.sourceforge.net

patchset against 2.6.23-rc2 and this set is an audit of 
/drivers/char/a* 
through drivers/char .   

this corrects missing ioremap return checks and balancing on 
iounmap calls..

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
----------------------------------------------------------
diff --git a/drivers/char/watchdog/iTCO_wdt.c 
b/drivers/char/watchdog/iTCO_wdt.c
index cd5a565..81c5901 100644
--- a/drivers/char/watchdog/iTCO_wdt.c
+++ b/drivers/char/watchdog/iTCO_wdt.c
@@ -621,6 +621,12 @@ static int iTCO_wdt_init(struct pci_dev *pdev, 
const struct pci_device_id *ent,
 		pci_read_config_dword(pdev, 0xf0, &base_address);
 		RCBA = base_address & 0xffffc000;
 		iTCO_wdt_private.gcs = ioremap((RCBA + 0x3410),4);
+		if (!iTCO_wdt_private.gcs) {
+			printk(KERN_ERR PFX "failed to ioremap\n");
+			ret = -ENOMEM;
+			goto out;
+		}
+
 	}
 
 	/* Check chipset's NO_REBOOT bit */


