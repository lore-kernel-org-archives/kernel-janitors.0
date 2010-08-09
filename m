From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 09 Aug 2010 19:51:44 +0000
Subject: [PATCH 12/18 v2] staging: crystalhd: call disable_pci_device() if pci_probe() failed
Message-Id: <1281383506-14438-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Jarod Wilson <jarod@redhat.com>, Manu Abraham <abraham.manu@gmail.com>, Scott Davilla <davilla@4pi.com>, Arnd Bergmann <arnd@arndb.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/crystalhd/crystalhd_lnx.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/crystalhd/crystalhd_lnx.c b/drivers/staging/crystalhd/crystalhd_lnx.c
index fbb80f0..115e79b 100644
--- a/drivers/staging/crystalhd/crystalhd_lnx.c
+++ b/drivers/staging/crystalhd/crystalhd_lnx.c
@@ -570,6 +570,7 @@ static int __devinit chd_dec_pci_probe(struct pci_dev *pdev,
 	rc = chd_pci_reserve_mem(pinfo);
 	if (rc) {
 		BCMLOG_ERR("Failed to setup memory regions.\n");
+		pci_disable_device(pdev);
 		return -ENOMEM;
 	}
 
-- 
1.7.0.4

