From: Daeseok Youn <daeseok.youn@gmail.com>
Date: Mon, 09 May 2016 02:46:50 +0000
Subject: [PATCH 1/3] staging: dgnc: fix 'line over 80 characters'
Message-Id: <20160509024650.GA6897@certreview.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lidza.louina@gmail.com
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

fix checkpatch.pl warning about 'line over 80 characters'.

Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
---
 drivers/staging/dgnc/dgnc_sysfs.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/dgnc/dgnc_sysfs.c b/drivers/staging/dgnc/dgnc_sysfs.c
index d825964..b8d41c5 100644
--- a/drivers/staging/dgnc/dgnc_sysfs.c
+++ b/drivers/staging/dgnc/dgnc_sysfs.c
@@ -189,19 +189,21 @@ static ssize_t dgnc_ports_msignals_show(struct device *p,
 	DGNC_VERIFY_BOARD(p, bd);
 
 	for (i = 0; i < bd->nasync; i++) {
-		if (bd->channels[i]->ch_open_count) {
+		struct channel_t *ch = bd->channels[i];
+
+		if (ch->ch_open_count) {
 			count += snprintf(buf + count, PAGE_SIZE - count,
 				"%d %s %s %s %s %s %s\n",
-				bd->channels[i]->ch_portnum,
-				(bd->channels[i]->ch_mostat & UART_MCR_RTS) ? "RTS" : "",
-				(bd->channels[i]->ch_mistat & UART_MSR_CTS) ? "CTS" : "",
-				(bd->channels[i]->ch_mostat & UART_MCR_DTR) ? "DTR" : "",
-				(bd->channels[i]->ch_mistat & UART_MSR_DSR) ? "DSR" : "",
-				(bd->channels[i]->ch_mistat & UART_MSR_DCD) ? "DCD" : "",
-				(bd->channels[i]->ch_mistat & UART_MSR_RI)  ? "RI"  : "");
+				ch->ch_portnum,
+				(ch->ch_mostat & UART_MCR_RTS) ? "RTS" : "",
+				(ch->ch_mistat & UART_MSR_CTS) ? "CTS" : "",
+				(ch->ch_mostat & UART_MCR_DTR) ? "DTR" : "",
+				(ch->ch_mistat & UART_MSR_DSR) ? "DSR" : "",
+				(ch->ch_mistat & UART_MSR_DCD) ? "DCD" : "",
+				(ch->ch_mistat & UART_MSR_RI)  ? "RI"  : "");
 		} else {
 			count += snprintf(buf + count, PAGE_SIZE - count,
-				"%d\n", bd->channels[i]->ch_portnum);
+				"%d\n", ch->ch_portnum);
 		}
 	}
 	return count;
-- 
2.8.2

