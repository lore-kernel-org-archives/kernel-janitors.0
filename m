From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 20:23:32 +0000
Subject: [PATCH 0/2] DMA-PPC4xx: Adjustments for three function implementations
Message-Id: <4d9b3ca7-e1bd-42f9-5933-550146812f1e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Feb 2018 21:16:42 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in two functions
  Improve a size determination in ppc440spe_adma_alloc_chan_resources()

 drivers/dma/ppc4xx/adma.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

-- 
2.16.1

