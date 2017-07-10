From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Jul 2017 15:08:32 +0000
Subject: [PATCH] char/mwave: make some arrays static const to make object code smaller
Message-Id: <20170710150832.28498-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Arnd Bergmann <arnd@arndb.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate arrays on the stack but make them static.  Makes
the object code smaller.  Also remove temporary variables that
have hard coded array sizes and just use ARRAY_SIZE instead and
wrap some lines that are wider than 80 chars to clean up some
checkpatch warnings.

Before:
   text	   data	    bss	    dec	    hex	filename
  11141	   2008	     64	  13213	   339d	drivers/char/mwave/smapi.o

After:
   text	   data	    bss	    dec	    hex	filename
  10697	   2352	     64	  13113	   3339	drivers/char/mwave/smapi.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/mwave/smapi.c | 48 ++++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/char/mwave/smapi.c b/drivers/char/mwave/smapi.c
index 8c5411a8f33f..691f5898bb32 100644
--- a/drivers/char/mwave/smapi.c
+++ b/drivers/char/mwave/smapi.c
@@ -128,10 +128,11 @@ int smapi_query_DSP_cfg(SMAPI_DSP_SETTINGS * pSettings)
 {
 	int bRC = -EIO;
 	unsigned short usAX, usBX, usCX, usDX, usDI, usSI;
-	unsigned short ausDspBases[] = { 0x0030, 0x4E30, 0x8E30, 0xCE30, 0x0130, 0x0350, 0x0070, 0x0DB0 };
-	unsigned short ausUartBases[] = { 0x03F8, 0x02F8, 0x03E8, 0x02E8 };
-	unsigned short numDspBases = 8;
-	unsigned short numUartBases = 4;
+	static const unsigned short ausDspBases[] = {
+		0x0030, 0x4E30, 0x8E30, 0xCE30,
+		0x0130, 0x0350, 0x0070, 0x0DB0 };
+	static const unsigned short ausUartBases[] = {
+		0x03F8, 0x02F8, 0x03E8, 0x02E8 };
 
 	PRINTK_1(TRACE_SMAPI, "smapi::smapi_query_DSP_cfg entry\n");
 
@@ -148,7 +149,7 @@ int smapi_query_DSP_cfg(SMAPI_DSP_SETTINGS * pSettings)
 	pSettings->bDSPEnabled = ((usCX & 0x0001) != 0);
 	pSettings->usDspIRQ = usSI & 0x00FF;
 	pSettings->usDspDMA = (usSI & 0xFF00) >> 8;
-	if ((usDI & 0x00FF) < numDspBases) {
+	if ((usDI & 0x00FF) < ARRAY_SIZE(ausDspBases)) {
 		pSettings->usDspBaseIO = ausDspBases[usDI & 0x00FF];
 	} else {
 		pSettings->usDspBaseIO = 0;
@@ -176,7 +177,7 @@ int smapi_query_DSP_cfg(SMAPI_DSP_SETTINGS * pSettings)
 
 	pSettings->bModemEnabled = ((usCX & 0x0001) != 0);
 	pSettings->usUartIRQ = usSI & 0x000F;
-	if (((usSI & 0xFF00) >> 8) < numUartBases) {
+	if (((usSI & 0xFF00) >> 8) < ARRAY_SIZE(ausUartBases)) {
 		pSettings->usUartBaseIO = ausUartBases[(usSI & 0xFF00) >> 8];
 	} else {
 		pSettings->usUartBaseIO = 0;
@@ -205,15 +206,16 @@ int smapi_set_DSP_cfg(void)
 	int bRC = -EIO;
 	int i;
 	unsigned short usAX, usBX, usCX, usDX, usDI, usSI;
-	unsigned short ausDspBases[] = { 0x0030, 0x4E30, 0x8E30, 0xCE30, 0x0130, 0x0350, 0x0070, 0x0DB0 };
-	unsigned short ausUartBases[] = { 0x03F8, 0x02F8, 0x03E8, 0x02E8 };
-	unsigned short ausDspIrqs[] = { 5, 7, 10, 11, 15 };
-	unsigned short ausUartIrqs[] = { 3, 4 };
-
-	unsigned short numDspBases = 8;
-	unsigned short numUartBases = 4;
-	unsigned short numDspIrqs = 5;
-	unsigned short numUartIrqs = 2;
+	static const unsigned short ausDspBases[] = {
+		0x0030, 0x4E30, 0x8E30, 0xCE30,
+		0x0130, 0x0350, 0x0070, 0x0DB0 };
+	static const unsigned short ausUartBases[] = {
+		0x03F8, 0x02F8, 0x03E8, 0x02E8 };
+	static const unsigned short ausDspIrqs[] = {
+		5, 7, 10, 11, 15 };
+	static const unsigned short ausUartIrqs[] = {
+		3, 4 };
+
 	unsigned short dspio_index = 0, uartio_index = 0;
 
 	PRINTK_5(TRACE_SMAPI,
@@ -221,11 +223,11 @@ int smapi_set_DSP_cfg(void)
 		mwave_3780i_irq, mwave_3780i_io, mwave_uart_irq, mwave_uart_io);
 
 	if (mwave_3780i_io) {
-		for (i = 0; i < numDspBases; i++) {
+		for (i = 0; i < ARRAY_SIZE(ausDspBases); i++) {
 			if (mwave_3780i_io = ausDspBases[i])
 				break;
 		}
-		if (i = numDspBases) {
+		if (i = ARRAY_SIZE(ausDspBases)) {
 			PRINTK_ERROR(KERN_ERR_MWAVE "smapi::smapi_set_DSP_cfg: Error: Invalid mwave_3780i_io address %x. Aborting.\n", mwave_3780i_io);
 			return bRC;
 		}
@@ -233,22 +235,22 @@ int smapi_set_DSP_cfg(void)
 	}
 
 	if (mwave_3780i_irq) {
-		for (i = 0; i < numDspIrqs; i++) {
+		for (i = 0; i < ARRAY_SIZE(ausDspIrqs); i++) {
 			if (mwave_3780i_irq = ausDspIrqs[i])
 				break;
 		}
-		if (i = numDspIrqs) {
+		if (i = ARRAY_SIZE(ausDspIrqs)) {
 			PRINTK_ERROR(KERN_ERR_MWAVE "smapi::smapi_set_DSP_cfg: Error: Invalid mwave_3780i_irq %x. Aborting.\n", mwave_3780i_irq);
 			return bRC;
 		}
 	}
 
 	if (mwave_uart_io) {
-		for (i = 0; i < numUartBases; i++) {
+		for (i = 0; i < ARRAY_SIZE(ausUartBases); i++) {
 			if (mwave_uart_io = ausUartBases[i])
 				break;
 		}
-		if (i = numUartBases) {
+		if (i = ARRAY_SIZE(ausUartBases)) {
 			PRINTK_ERROR(KERN_ERR_MWAVE "smapi::smapi_set_DSP_cfg: Error: Invalid mwave_uart_io address %x. Aborting.\n", mwave_uart_io);
 			return bRC;
 		}
@@ -257,11 +259,11 @@ int smapi_set_DSP_cfg(void)
 
 
 	if (mwave_uart_irq) {
-		for (i = 0; i < numUartIrqs; i++) {
+		for (i = 0; i < ARRAY_SIZE(ausUartIrqs); i++) {
 			if (mwave_uart_irq = ausUartIrqs[i])
 				break;
 		}
-		if (i = numUartIrqs) {
+		if (i = ARRAY_SIZE(ausUartIrqs)) {
 			PRINTK_ERROR(KERN_ERR_MWAVE "smapi::smapi_set_DSP_cfg: Error: Invalid mwave_uart_irq %x. Aborting.\n", mwave_uart_irq);
 			return bRC;
 		}
-- 
2.11.0

