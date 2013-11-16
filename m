From: Aldo Iljazi <mail@aldo.io>
Date: Sat, 16 Nov 2013 14:17:55 +0000
Subject: [PATCH] Drivers: staging: ft1000-usb: ft1000_proc.c: fixed a few styling issues.
Message-Id: <1384611475-12420-1-git-send-email-mail@aldo.io>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: marek.belisko@gmail.com
Cc: gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixed a few styling issues, particularly:

Lines 36,42: Inserted a space before the open paranthesis.
Line 50: Removed space between function name and open parenthesis.
Lines 56,57: Removed trailing whitespace.
lines: 130, 133: Replaced spaces with tabs for identation.

Signed-off-by: Aldo Iljazi <mail@aldo.io>
---
 drivers/staging/ft1000/ft1000-usb/ft1000_proc.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/ft1000/ft1000-usb/ft1000_proc.c b/drivers/staging/ft1000/ft1000-usb/ft1000_proc.c
index 5ead942..2575d0d 100644
--- a/drivers/staging/ft1000/ft1000-usb/ft1000_proc.c
+++ b/drivers/staging/ft1000/ft1000-usb/ft1000_proc.c
@@ -33,13 +33,13 @@
 
 #define seq_putx(m, message, size, var) \
 	seq_printf(m, message);	\
-	for(i = 0; i < (size - 1); i++) \
+	for (i = 0; i < (size - 1); i++) \
 		seq_printf(m, "%02x:", var[i]); \
 	seq_printf(m, "%02x\n", var[i])
 
 #define seq_putd(m, message, size, var) \
 	seq_printf(m, message); \
-	for(i = 0; i < (size - 1); i++) \
+	for (i = 0; i < (size - 1); i++) \
 		seq_printf(m, "%d.", var[i]); \
 	seq_printf(m, "%d\n", var[i])
 
@@ -47,14 +47,14 @@
 #define FTNET_PROC init_net.proc_net
 
 
-int ft1000_read_dpram16 (struct ft1000_usb *ft1000dev, u16 indx,
+int ft1000_read_dpram16(struct ft1000_usb *ft1000dev, u16 indx,
 			 u8 *buffer, u8 highlow);
 
 
 static int ft1000ReadProc(struct seq_file *m, void *v)
 {
-	static const char *status[] = { 
-		"Idle (Disconnect)", 
+	static const char *status[] = {
+		"Idle (Disconnect)",
 		"Searching",
 		"Active (Connected)",
 		"Waiting for L2",
@@ -127,10 +127,10 @@ static int ft1000ReadProc(struct seq_file *m, void *v)
 	}
 
 	seq_printf(m, "Connection Time: %02ld:%02ld:%02ld\n",
-      		((delta / 3600) % 24), ((delta / 60) % 60), (delta % 60));
+		((delta / 3600) % 24), ((delta / 60) % 60), (delta % 60));
 	seq_printf(m, "Connection Time[s]: %ld\n", delta);
 	seq_printf(m, "Asic ID: %s\n",
-      	(info->AsicID) = ELECTRABUZZ_ID ? "ELECTRABUZZ ASIC" : "MAGNEMITE ASIC");
+	(info->AsicID) = ELECTRABUZZ_ID ? "ELECTRABUZZ ASIC" : "MAGNEMITE ASIC");
 	seq_putx(m, "SKU: ", SKUSZ, info->Sku);
 	seq_putx(m, "EUI64: ", EUISZ, info->eui64);
 	seq_putd(m, "DSP version number: ", DSPVERSZ, info->DspVer);
-- 
1.7.9.5

