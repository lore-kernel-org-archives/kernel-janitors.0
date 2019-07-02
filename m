From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 09:50:10 +0000
Subject: [PATCH] brcmfmac: Replace two seq_printf() calls in brcmf_feat_fwcap_debugfs_read()
Message-Id: <7d96085a-76e8-c290-698a-e1473d3f4be7@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, brcm80211-dev-list@cypress.com, brcm80211-dev-list.pdl@broadcom.com, Arend van Spriel <arend.vanspriel@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, "David S. Miller" <davem@davemloft.net>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@codeaurora.org>, Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Wright Feng <wright.feng@cypress.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 11:31:07 +0200

A line break and a single string should be put into a sequence.
Thus use the corresponding output functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
index 73aff4e4039d..ec0e80296e43 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c
@@ -225,10 +225,10 @@ static int brcmf_feat_fwcap_debugfs_read(struct seq_file *seq, void *data)
 	}

 	/* Usually there is a space at the end of capabilities string */
-	seq_printf(seq, "%s", caps);
+	seq_puts(seq, caps);
 	/* So make sure we don't print two line breaks */
 	if (tmp > caps && *(tmp - 1) != '\n')
-		seq_printf(seq, "\n");
+		seq_putc(seq, '\n');

 	return 0;
 }
--
2.22.0
