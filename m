From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 21 May 2007 17:40:35 +0000
Subject: [KJ] questions about memory allocation and GFP_DMA zone modifier
Message-Id: <Pine.LNX.4.64.0705211331500.24911@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  first, because of this definition in include/linux/gfp.h:

#define GFP_DMA         __GFP_DMA

there is a mixture of usage in the kernel source tree:

  $ grep -rw GFP_DMA * | wc -l
  245
  $ grep -rw __GFP_DMA * | wc -l
  37

is there an actual semantic difference between those two?  is there
supposed to be?

  and, second, given that include/linux/gfp.h includes the definition:

#define __get_dma_pages(gfp_mask, order) \
                __get_free_pages((gfp_mask) | GFP_DMA,(order))

is there any value in replacing the longer forms with a call to
__get_dma_pages() for consistency?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
