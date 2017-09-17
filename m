From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 17 Sep 2017 22:33:04 +0000
Subject: [PATCH 0/2] rapidio: Two fixes for 'rio_dma_transfer()'
Message-Id: <cover.1505687047.git.christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mporter@kernel.crashing.org, alexandre.bounine@idt.com, lstoakes@gmail.com, akpm@linux-foundation.org, jesper.nilsson@axis.com, christian.koenig@amd.com, logang@deltatee.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

These 2 patches are really close and are both related to error handling
in 'rio_dma_transfer()'.
The first one fixes some resources leak in case of error.
The 2nd one fixes a test so that the corresponding error can be handled
correctly.

I've splitted this into 2 paches because the first one looks trivial to me.
But the 2nd one should require more attention, IMO. The existing error
handling was dead code because 'dma_map_sg()' can not return -EFAULT. So
this error handling code has never been executed/tested and I can't test it
myself.

Christophe JAILLET (2):
  rapidio: Fix resources leak in error handling path in
    'rio_dma_transfer()'
  rapidio: Fix an error handling in 'rio_dma_transfer()'

 drivers/rapidio/devices/rio_mport_cdev.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.11.0

