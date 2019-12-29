From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 29 Dec 2019 15:42:54 +0000
Subject: [PATCH 0/4] use mmgrab
Message-Id: <1577634178-22530-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kvm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org

Mmgrab was introduced in commit f1f1007644ff ("mm: add new mmgrab()
helper") and most of the kernel was updated to use it. Update a few
remaining files.

---

 arch/openrisc/kernel/smp.c          |    2 +-
 drivers/misc/cxl/context.c          |    2 +-
 drivers/vfio/pci/vfio_pci_nvlink2.c |    2 +-
 drivers/vfio/vfio_iommu_spapr_tce.c |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
