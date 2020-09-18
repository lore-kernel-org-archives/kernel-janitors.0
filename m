From: Colin King <colin.king@canonical.com>
Date: Fri, 18 Sep 2020 21:47:31 +0000
Subject: [PATCH] staging/emxx_udc: fix indenting issue on a couple of statements
Message-Id: <20200918214731.48750-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A couple of statements are indented too deeply, remove the
extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/emxx_udc/emxx_udc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index 4ceaf1ead123..a30b4f5b199b 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -2163,8 +2163,8 @@ static int _nbu2ss_enable_controller(struct nbu2ss_udc *udc)
 
 	_nbu2ss_writel(&udc->p_regs->AHBSCTR, WAIT_MODE);
 
-		_nbu2ss_writel(&udc->p_regs->AHBMCTR,
-			       HBUSREQ_MODE | HTRANS_MODE | WBURST_TYPE);
+	_nbu2ss_writel(&udc->p_regs->AHBMCTR,
+		       HBUSREQ_MODE | HTRANS_MODE | WBURST_TYPE);
 
 	while (!(_nbu2ss_readl(&udc->p_regs->EPCTR) & PLL_LOCK)) {
 		waitcnt++;
@@ -2175,7 +2175,7 @@ static int _nbu2ss_enable_controller(struct nbu2ss_udc *udc)
 		}
 	}
 
-		_nbu2ss_bitset(&udc->p_regs->UTMI_CHARACTER_1, USB_SQUSET);
+	_nbu2ss_bitset(&udc->p_regs->UTMI_CHARACTER_1, USB_SQUSET);
 
 	_nbu2ss_bitset(&udc->p_regs->USB_CONTROL, (INT_SEL | SOF_RCV));
 
-- 
2.27.0
