From: Scott Thompson <postfailathushmaildotcom@yahoo.com>
Date: Thu, 23 Aug 2007 03:33:10 +0000
Subject: [PATCH 5 of 5 resend ] /drivers/char/watchdog ioremap balancing/ returncode check
Message-Id: <989872.81202.qm@web44910.mail.sp1.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

patchset against 2.6.23-rc3.  
corrects missing ioremap return checks and balancing on iounmap calls, integrated changes per list
recommendations on the original set of patches..

Warning -- cleanup handler here may miss additional required cleanup as has occurred on other
portions of ioremap audit.

This patch had been submitted previously but hushmail client caused wordwrap issues, resending
with different mail client.

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
----------------------------------------------------------
diff --git a/drivers/char/watchdog/iTCO_wdt.c b/drivers/char/watchdog/iTCO_wdt.c
index cd5a565..f87cac7 100644
--- a/drivers/char/watchdog/iTCO_wdt.c
+++ b/drivers/char/watchdog/iTCO_wdt.c
@@ -621,6 +621,12 @@ static int iTCO_wdt_init(struct pci_dev *pdev,
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


       
____________________________________________________________________________________
Take the Internet to Go: Yahoo!Go puts the Internet in your pocket: mail, news, photos & more. 
http://mobile.yahoo.com/go?refer=1GNXIC


      ____________________________________________________________________________________
Shape Yahoo! in your own image.  Join our Network Research Panel today!   http://surveylink.yahoo.com/gmrs/yahoo_panel_invite.asp?a=7 



