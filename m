From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Aug 2020 13:15:12 +0000
Subject: [PATCH] staging: rtl8192e: fix missing failure check on a call to dev_alloc_name
Message-Id: <20200821131512.348775-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, wlanfae <wlanfae@realtek.com>, Larry Finger <Larry.Finger@lwfinger.net>, Mike McCormack <mikem@ring3k.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the second call to dev_alloc_name is not checking if this
failed.  Add the check and perform necessary cleanup on an error.

Addresses-Coverity: ("Unchecked return value")
Fixes: 94a799425eee ("rtl8192e: Import new version of driver from realtek")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index fac58eebf263..7b15faeefff2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -2489,7 +2489,8 @@ static int _rtl92e_pci_probe(struct pci_dev *pdev,
 	if (dev_alloc_name(dev, ifname) < 0) {
 		RT_TRACE(COMP_INIT,
 			 "Oops: devname already taken! Trying wlan%%d...\n");
-		dev_alloc_name(dev, ifname);
+		if (dev_alloc_name(dev, ifname) < 0)
+			goto err_unmap;
 	}
 
 	RT_TRACE(COMP_INIT, "Driver probe completed1\n");
-- 
2.27.0
