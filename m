From: James Smart <jsmart2021@gmail.com>
Date: Wed, 20 May 2020 18:59:26 +0000
Subject: [PATCH 0/3] lpfc: Fix errors in LS receive refactoring
Message-Id: <20200520185929.48779-1-jsmart2021@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-nvme@lists.infradead.org
Cc: axboe@kernel.dk, James Smart <jsmart2021@gmail.com>, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com, kernel-janitors@vger.kernel.org, hch@infradead.org, paul.ely@broadcom.com, hare@suse.de, dan.carpenter@oracle.com

A prior patch set refactored lpfc to create common routines for NVME LS
handling for use by both the initiator and target paths.  The refactoring
introduced several errors spotted by additional testing and static checker
reporting.

This patch set corrects those errors.

The patches should enter via the nvme tree, as the lpfc modifications were
in support of nvme-fc transport api deltas merged via the nvme tree.

-- james


James Smart (3):
  lpfc: Fix pointer checks and comments in LS receive refactoring
  lpfc: fix axchg pointer reference after free and double frees
  lpfc: Fix return value in __lpfc_nvme_ls_abort

 drivers/scsi/lpfc/lpfc_nvme.c  |  2 +-
 drivers/scsi/lpfc/lpfc_nvmet.c | 29 ++++++++++++++++++-----------
 drivers/scsi/lpfc/lpfc_sli.c   | 10 ++++++----
 3 files changed, 25 insertions(+), 16 deletions(-)

-- 
2.26.1
