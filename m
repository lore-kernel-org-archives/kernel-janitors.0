From: "Milan P. Gandhi" <mgandhi@redhat.com>
Date: Tue, 12 Mar 2019 12:49:54 +0000
Subject: [PATCH 0/2] scsi: qla2xxx: Fix for a formatting issue and typo in qla_bsg.c
Message-Id: <20190312124937.GA13922@machine1>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: qla2xxx-upstream@qlogic.com, jejb@linux.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, dan.carpenter@oracle.com

This patch series fixes below two formatting/typos in qla_bsg.c:
1. Corrected alignment at the start of comment section
2. Fixed 'iiDMA' cmd spelling

Thanks,
Milan.
---
 drivers/scsi/qla2xxx/qla_bsg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
