From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Fri, 18 Apr 2014 17:57:51 +0000
Subject: [PATCH] Staging: crystalhd: Mark local functions as static
Message-Id: <1397843871-10850-1-git-send-email-prtvar.b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nsankar@broadcom.com, jarod@wilsonet.com, davilla@4pi.com, abraham.manu@gmail.com, gregkh@linuxfoundation.org, amarjargal16@gmail.com, dan.carpenter@oracle.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Bojan Prtvar <prtvar.b@gmail.com>

This fixes the following sparse warnings:
drivers/staging/crystalhd/crystalhd_lnx.c:631:5: warning: symbol 'chd_dec_pci_suspend' was not declared. Should it be static?
drivers/staging/crystalhd/crystalhd_lnx.c:665:5: warning: symbol 'chd_dec_pci_resume' was not declared. Should it be static?
drivers/staging/crystalhd/crystalhd_lnx.c:78:29: warning: symbol 'chd_dec_alloc_iodata' was not declared. Should it be static?
drivers/staging/crystalhd/crystalhd_lnx.c:99:6: warning: symbol 'chd_dec_free_iodata' was not declared. Should it be static?

Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
---
 drivers/staging/crystalhd/crystalhd_lnx.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/crystalhd/crystalhd_lnx.c b/drivers/staging/crystalhd/crystalhd_lnx.c
index c1f6163..590e0b8 100644
--- a/drivers/staging/crystalhd/crystalhd_lnx.c
+++ b/drivers/staging/crystalhd/crystalhd_lnx.c
@@ -75,8 +75,8 @@ static int chd_dec_disable_int(struct crystalhd_adp *adp)
 	return 0;
 }
 
-struct crystalhd_ioctl_data *chd_dec_alloc_iodata(struct crystalhd_adp *adp,
-					 bool isr)
+static struct crystalhd_ioctl_data *
+chd_dec_alloc_iodata(struct crystalhd_adp *adp, bool isr)
 {
 	unsigned long flags = 0;
 	struct crystalhd_ioctl_data *temp;
@@ -96,7 +96,7 @@ struct crystalhd_ioctl_data *chd_dec_alloc_iodata(struct crystalhd_adp *adp,
 	return temp;
 }
 
-void chd_dec_free_iodata(struct crystalhd_adp *adp,
+static void chd_dec_free_iodata(struct crystalhd_adp *adp,
 			 struct crystalhd_ioctl_data *iodata, bool isr)
 {
 	unsigned long flags = 0;
@@ -628,7 +628,7 @@ err:
 }
 
 #ifdef CONFIG_PM
-int chd_dec_pci_suspend(struct pci_dev *pdev, pm_message_t state)
+static int chd_dec_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 {
 	struct crystalhd_adp *adp;
 	struct crystalhd_ioctl_data *temp;
@@ -662,7 +662,7 @@ int chd_dec_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-int chd_dec_pci_resume(struct pci_dev *pdev)
+static int chd_dec_pci_resume(struct pci_dev *pdev)
 {
 	struct crystalhd_adp *adp;
 	enum BC_STATUS sts = BC_STS_SUCCESS;
-- 
1.7.9.5

