From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Nov 2015 22:02:48 +0000
Subject: [PATCH 0/3] constify mmu_notifier_ops structures
Message-Id: <1448834571-2988-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

mmu_notifier_ops structures are never modified, so declare them all as
const.

---

 drivers/infiniband/core/umem_odp.c |    2 +-
 drivers/iommu/amd_iommu_v2.c       |    2 +-
 drivers/xen/gntdev.c               |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
