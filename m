From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 May 2017 11:51:54 +0000
Subject: [PATCH 0/4] net: stmmac: Fine-tuning for four function implementations
Message-Id: <aa58027a-a39c-963e-4376-a4d5312ee118@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 May 2017 13:48:03 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Combine three seq_printf() calls into a seq_puts() in stmmac_sysfs_dma_cap_read()
  Replace five seq_printf() calls by seq_puts()
  Use seq_putc() in sysfs_display_ring()
  Delete an unnecessary return statement in stmmac_get_tx_hwtstamp()

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

-- 
2.12.2

