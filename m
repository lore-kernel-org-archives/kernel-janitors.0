From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 May 2017 07:25:24 +0000
Subject: [PATCH 0/3] ath9k: Fine-tuning for some function implementations
Message-Id: <03575993-754d-924c-9736-2a8d19e98fa5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ath9k-devel@qca.qualcomm.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 May 2017 09:19:09 +0200

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Reduce function calls for sequence output in read_file_dma()
  Replace four seq_printf() calls by seq_putc()
  Adjust a null pointer check in three functions

 drivers/net/wireless/ath/ath9k/debug.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

-- 
2.12.2

