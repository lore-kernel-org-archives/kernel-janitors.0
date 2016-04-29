From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 29 Apr 2016 20:09:07 +0000
Subject: [PATCH 0/5] Use dma_pool_zalloc
Message-Id: <1461960552-7429-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Dma_pool_zalloc combines dma_pool_alloc and memset 0.  The semantic patch
that makes this transformation is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
T *d;
expression e;
statement S;
@@

        d -            dma_pool_alloc
+            dma_pool_zalloc
             (...);
        if (!d) S
-       memset(d, 0, sizeof(T));

@@
expression d,e;
statement S;
@@

        d -            dma_pool_alloc
+            dma_pool_zalloc
             (...);
        if (!d) S
-       memset(d, 0, sizeof(*d));
// </smpl>

---

 drivers/crypto/marvell/tdma.c    |    5 ++---
 drivers/dma/fsldma.c             |    3 +--
 drivers/dma/ioat/init.c          |    5 ++---
 drivers/dma/mmp_pdma.c           |    3 +--
 drivers/dma/xilinx/xilinx_vdma.c |    3 +--
 5 files changed, 7 insertions(+), 12 deletions(-)
