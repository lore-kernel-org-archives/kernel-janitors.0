From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Nov 2015 10:06:52 +0000
Subject: [PATCH 0/9] constify pci_error_handlers structures
Message-Id: <1447495621-9161-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MPT-FusionLinux.pdl@avagotech.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-scsi@vger.kernel.org, qat-linux@intel.com, linux-crypto@vger.kernel.org, kvm@vger.kernel.org

Constify never-modified pci_error_handlers structures.

---

 drivers/crypto/qat/qat_common/adf_aer.c         |    2 +-
 drivers/misc/genwqe/card_base.c                 |    2 +-
 drivers/net/ethernet/cavium/liquidio/lio_main.c |    2 +-
 drivers/net/ethernet/sfc/efx.c                  |    2 +-
 drivers/scsi/be2iscsi/be_main.c                 |    2 +-
 drivers/scsi/bfa/bfad.c                         |    2 +-
 drivers/scsi/csiostor/csio_init.c               |    2 +-
 drivers/scsi/mpt3sas/mpt3sas_scsih.c            |    2 +-
 drivers/vfio/pci/vfio_pci.c                     |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)
