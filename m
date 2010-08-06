From: Kulikov Vasiliy <segooon@gmail.com>
Date: Fri, 06 Aug 2010 19:52:50 +0000
Subject: [PATCH 12/18] staging: crystalhd: call disable_pci_device() if pci_probe() failed
Message-Id: <1281124373-13756-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Jarod Wilson <jarod@redhat.com>, Manu Abraham <abraham.manu@gmail.com>, Scott Davilla <davilla@4pi.com>, Arnd Bergmann <arnd@arndb.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Driver should call disable_pci_device() if it returns from pci_probe()
with error. Also it must not be called if pci_request_region() fails as
it means that somebody uses device resources and rules the device.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/crystalhd/crystalhd_lnx.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/staging/crystalhd/crystalhd_lnx.c b/drivers/staging/crystalhd/crystalhd_lnx.c
index fbb80f0..0e52075 100644
--- a/drivers/staging/crystalhd/crystalhd_lnx.c
+++ b/drivers/staging/crystalhd/crystalhd_lnx.c
@@ -570,6 +570,8 @@ static int __devinit chd_dec_pci_probe(struct pci_dev *pdev,
 	rc = chd_pci_reserve_mem(pinfo);
 	if (rc) {
 		BCMLOG_ERR("Failed to setup memory regions.\n");
+		if (rc != -EBUSY)
+			pci_disable_device(pdev);
 		return -ENOMEM;
 	}
 
-- 
1.7.0.4

