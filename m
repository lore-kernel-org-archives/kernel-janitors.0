From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 14 Aug 2019 07:21:03 +0000
Subject: [PATCH v2 linux-next 0/2] change mux_configure32() to static
Message-Id: <20190814072105.144107-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.j.williams@intel.com, dmaengine@vger.kernel.org, vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>

First patch is to make mux_configure32() static to avoid sparse warning,
the second patch is to chage alignment of two functions.

v2: change subject from "drivers: dma: Fix sparse warning for mux_configure32"
to "drivers: dma: make mux_configure32 static", and cleanup the log. And add 
one patch to change alignment of two functions. 

Mao Wenan (2):
  drivers: dma: make mux_configure32 static
  drivers: dma: change alignment of mux_configure32 and
    fsl_edma_chan_mux

 drivers/dma/fsl-edma-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.20.1
