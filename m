From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 16:32:58 +0000
Subject: [PATCH 0/3] RapidIO: Tsi721-DMA: Adjustments for five function implementations
Message-Id: <33c63b12-7828-891a-31ef-76a2e3c6b90c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 17:28:32 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in tsi721_alloc_chan_resources()
  Delete an unnecessary variable initialisation in tsi721_alloc_chan_resources()
  Adjust six checks for null pointers

 drivers/rapidio/devices/tsi721_dma.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

-- 
2.15.1

